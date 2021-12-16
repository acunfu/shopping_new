package dao.impl;

import bean.User;
import dao.UserDao;
import org.apache.commons.dbutils.*;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.JDBCUtils;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;


/**
 * 用户数据库操作接口实现类
 */
public class UserDaoImpl implements UserDao {

    //执行sql语句
    private QueryRunner query = new QueryRunner();

    //添加一个用户
    @Override
    public int addUser(User u) {
        String sql = "insert into shop_user(u_name,u_pwd,u_author) values(?,?,?)";
        //获取数据库连接
        Connection conn = JDBCUtils.getConnection();
        //执行插入
        int i = 0;
        try {
            i = query.execute(conn, sql, u.getuName(), u.getuPwd(), u.getuAuthor());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn);
        }
        return i;
    }

    //通过用户id删除一个用户
    @Override
    public int deleteUserById(Integer id) {
        String sql = "delete from shop_user where u_id=?";
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

    //更新用户信息
    @Override
    public int updateUser(User u) {
        String sql = "update shop_user set u_name=?,u_pwd=?,u_author=? where u_id=?";
        //获取数据库连接
        Connection conn = JDBCUtils.getConnection();
        //执行更新
        int i = 0;
        try {
            i = query.update(conn, sql, u.getuName(), u.getuPwd(), u.getuAuthor(), u.getuId());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn);
        }
        return i;
    }

    //通过用户id查询一个用户
    @Override
    public User queryUserById(Integer id) {
        String sql = "select * from shop_user where u_id=?";
        //获取数据库连接
        Connection conn = JDBCUtils.getConnection();
        //数据库中表字段为下划线命名，Produce类中属性为驼峰命名，处理查询结果下划线->驼峰
        BeanProcessor bean = new GenerousBeanProcessor();
        RowProcessor processor = new BasicRowProcessor(bean);
        //执行查询
        User u = null;
        try {
            u = this.query.query(conn, sql, new BeanHandler<>(User.class, processor), id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn);
        }
        return u;
    }

    //通过用户名和密码对象查询用户
    @Override
    public User queryUser(User u) {
        String sql = "select * from shop_user where u_name=? and u_pwd=?";
        //获取数据库连接
        Connection conn = JDBCUtils.getConnection();
        //数据库中表字段为下划线命名，Produce类中属性为驼峰命名，处理查询结果下划线->驼峰
        BeanProcessor bean = new GenerousBeanProcessor();
        RowProcessor processor = new BasicRowProcessor(bean);
        //执行查询
        User user = null;
        try {
            user = query.query(conn, sql, new BeanHandler<>(User.class, processor), u.getuName(), u.getuPwd());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn);
        }
        return user;
    }

    //查询所有用户
    @Override
    public List<User> queryAllUser() {
        String sql = "select * from shop_user";
        //获取数据库连接
        Connection conn = JDBCUtils.getConnection();
        //数据库中表字段为下划线命名，Produce类中属性为驼峰命名，处理查询结果下划线->驼峰
        BeanProcessor bean = new GenerousBeanProcessor();
        RowProcessor processor = new BasicRowProcessor(bean);
        //执行查询
        List<User> us = null;
        try {
            us = query.query(conn, sql, new BeanListHandler<>(User.class, processor));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.close(conn);
        }

        return us;
    }
}
