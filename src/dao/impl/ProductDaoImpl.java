package dao.impl;

import bean.Product;
import bean.User;
import dao.ProductDao;
import org.apache.commons.dbutils.*;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.JDBCUtils;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 * 产品的数据库操作接口实现类
 * @Author Mr.A
 * @Description //TODO lenovo
 * @Param
 * @return
 **/
public class ProductDaoImpl implements ProductDao {

    //运行sql语句
    private QueryRunner query = new QueryRunner();

    //在数据库中添加一个产品
    @Override
    public int addProduct(Product p) {

        String sql = "insert into shop_product(p_name,p_description,p_price) values(?,?,?)";
        //获取数据库连接
        Connection conn = JDBCUtils.getConnection();

        //执行插入
        int i = 0;
        try {
            i = query.execute(conn, sql, p.getpName(), p.getpDescription(), p.getpPrice());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn);
        }
        return i;
    }


    //通过产品id，删除一个产品
    @Override
    public int deleteProductById(Integer id) {
        String sql = "delete from shop_product where p_id=?";

        //获取数据库连接
        Connection conn = JDBCUtils.getConnection();
        //执行删除
        int i = 0;
        try {
            i = query.execute(conn, sql, id);
            JDBCUtils.close(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn);
        }

        return i;
    }

    //更新一个产品
    @Override
    public int updateProduct(Product p) {
        String sql = "update shop_product set p_name=?,p_description=?,p_price=? where p_id=?";
        //获取连接
        Connection conn = JDBCUtils.getConnection();
        //执行更新
        int i = 0;
        try {
            i = query.update(conn, sql, p.getpName(), p.getpDescription(), p.getpPrice(), p.getpId());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn);
        }
        return i;
    }

    //通过产品id查询一个产品
    @Override
    public Product queryProductById(Integer id) {
        String sql = "select * from shop_product where p_id=?";
        //获取数据库连接
        Connection conn = JDBCUtils.getConnection();
        //数据库中表字段为下划线命名，Produce类中属性为驼峰命名，处理查询结果下划线->驼峰
        BeanProcessor bean = new GenerousBeanProcessor();
        RowProcessor processor = new BasicRowProcessor(bean);
        Product product = null;
        //执行查询
        try {
            product = query.query(conn, sql, new BeanHandler<>(Product.class, processor), id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn);
        }
        return product;
    }

    //通过关键词查询产品
    @Override
    public List<Product> queryProductByKey(String key) {
        String sql = "select * from shop_product where p_name like '%"+key+"%'";
        //获取数据库连接
        Connection conn = JDBCUtils.getConnection();
        //数据库中表字段为下划线命名，Produce类中属性为驼峰命名，处理查询结果下划线->驼峰
        BeanProcessor bean = new GenerousBeanProcessor();
        RowProcessor processor = new BasicRowProcessor(bean);
        List<Product> list = null;

        //执行查询
        try {
            list = this.query.query(conn, sql, new BeanListHandler<>(Product.class, processor));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn);
        }

        return list;
    }

    //查询所有产品
    @Override
    public List<Product> queryAllProduct() {
        String sql = "select * from shop_product";
        //获取数据库连接
        Connection conn = JDBCUtils.getConnection();
        //数据库中表字段为下划线命名，Produce类中属性为驼峰命名，处理查询结果下划线->驼峰
        BeanProcessor bean = new GenerousBeanProcessor();
        RowProcessor processor = new BasicRowProcessor(bean);
        List<Product> list = null;

        //执行查询
        try {
            list = query.query(conn, sql, new BeanListHandler<>(Product.class, processor));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn);
        }

        return list;
    }
}
