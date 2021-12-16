package dao;

import bean.Product;
import bean.User;

import java.util.List;

/**
 * 产品的数据库操作接口
 */
public interface ProductDao {

    //在数据库中添加一个产品
    int addProduct(Product g);

    //通过产品id，删除一个产品
    int deleteProductById(Integer id);

    //更新一个产品
    int updateProduct(Product g);

    //通过产品id查询一个产品
    Product queryProductById(Integer id);

    //通过关键词查询产品
    List<Product> queryProductByKey(String key);

    //查询所有产品
    List<Product> queryAllProduct();
}
