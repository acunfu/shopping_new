package dao;

import bean.User;

import java.util.List;

/**
 * 用户数据库操作接口
 */
public interface UserDao {

    //添加一个用户
    int addUser(User u);

    //通过用户id删除一个用户
    int deleteUserById(Integer id);

    //更新用户信息
    int updateUser(User u);

    //通过用户id查询一个用户
    User queryUserById(Integer id);

    //通过用户名和密码对象查询用户
    User queryUser(User u);

    //查询所有用户
    List<User> queryAllUser();
}
