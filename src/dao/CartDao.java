package dao;

import bean.Cart;

public interface CartDao {

    Cart getCartByUserId(Integer uid);

    int addProductToCart(Integer pid, Integer uid);

    int deleteProductFromCart(Integer pid, Integer uid);

    int deleteProductItemFromCart(Integer pid, Integer uid);
}
