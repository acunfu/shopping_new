package dao.impl;
/**
 * 购物车dao
 * @Author Mr.A
 * @Description //TODO lenovo
 * @Param
 * @return
 **/
import bean.Cart;
import bean.Product;
import dao.CartDao;
import org.apache.commons.dbutils.*;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.JDBCUtils;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class CartDaoImpl implements CartDao {
    //sql语句
    private QueryRunner query = new QueryRunner();

    //通过用户id获取购物车数据
    @Override
    public Cart getCartByUserId(Integer uid) {
        String sql = "select sp.* from shop_product sp left join shop_cart_item sci  on sci.pid=sp.p_id " +
                "left join shop_user su on sci.uid=su.u_id where su.u_id=?";
        //获取数据库连接
        Connection conn = JDBCUtils.getConnection();
        //数据库中表字段为下划线命名，Produce类中属性为驼峰命名，处理查询结果下划线->驼峰
        BeanProcessor bean = new GenerousBeanProcessor();
        RowProcessor processor = new BasicRowProcessor(bean);
        List<Product> list = null;
        Cart cart = new Cart(uid);
        //执行查询
        try {
            list = query.query(conn, sql, new BeanListHandler<>(Product.class, processor), uid);

            for (Product p : list) {
                cart.addProductToCartList(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

            //释放资源
            JDBCUtils.close(conn);
        }
        return cart;
    }

    //添加一条产品id到对应用户
    @Override
    public int addProductToCart(Integer pid, Integer uid) {
        String sql = "insert into shop_cart_item(pid,uid) values(?,?)";
        //获取数据库连接
        Connection conn = JDBCUtils.getConnection();

        try {
            return query.update(conn, sql, pid, uid);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn);
        }

        return 0;
    }

    //删除一条产品id从对应用户
    @Override
    public int deleteProductFromCart(Integer pid, Integer uid) {
        String sql = "delete from shop_cart_item where pid=? and uid=? order by cid limit 1";
        //获取数据库连接
        Connection conn = JDBCUtils.getConnection();

        try {
            return query.update(conn, sql, pid, uid);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn);
        }

        return 0;
    }

    //删除用户购物车中对应pid的所有记录
    @Override
    public int deleteProductItemFromCart(Integer pid, Integer uid) {
        String sql = "delete from shop_cart_item where pid=? and uid=?";
        //获取数据库连接
        Connection conn = JDBCUtils.getConnection();

        try {
            return query.update(conn, sql, pid, uid);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn);
        }

        return 0;
    }
}
