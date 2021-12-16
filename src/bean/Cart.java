package bean;

import dao.CartDao;
import dao.impl.CartDaoImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


/**
 * 购物车类
 * @Author Mr.A
 * @Description //TODO lenovo
 * @Param
 * @return
 **/
public class Cart {

    private Integer uId;
    private List<CartItem> list = new ArrayList<>();
    private Double totalPrice = 0.0;

    private CartDao cd = new CartDaoImpl();

    public Cart(Integer uId) {
        this.uId = uId;
    }

    //将商品添加到购物车
    public void addProductToCartList(Product product) {
        for (CartItem item : list) {
            if (item.getProduct().getpId() == product.getpId()) {
                item.setCount(item.getCount() + 1);
                return;
            }
        }
        list.add(new CartItem(product, 1));
    }

    //将商品添加到数据库
    public void addProductToCart(Product product) {
        //将商品添加到数据库中
        int i = cd.addProductToCart(product.getpId(), uId);

        //数据库添加成功，更新购物车中数据
        if (i > 0) {
            addProductToCartList(product);
        }
    }

    //从数据库中删除一件商品
    public void deleteProductFromCart(Integer pid) {

        //数据库中删除一条商品启示
        int i = cd.deleteProductFromCart(pid, uId);
        //数据库中删除成功，更新购物车中数据
        if (i > 0) {
            Iterator<CartItem> it = list.iterator();
            while (it.hasNext()) {
                CartItem next = it.next();
                if (next.getProduct().getpId() == pid && next.getCount() > 1) {
                    next.setCount(next.getCount() - 1);
                } else {
                    it.remove();
                }
            }


        }
    }

    //删除购物车所有指定商品
    public void deleteProductItemFromCart(Integer pid) {
        int i = cd.deleteProductItemFromCart(pid, uId);
        if (i > 0) {
            Iterator<CartItem> it = list.iterator();
            while (it.hasNext()) {
                it.next();
                it.remove();
            }
        }
    }




    public Double getTotalPrice() {
        for (CartItem cartItem : list) {
            totalPrice += (cartItem.getProduct().getpPrice() * cartItem.getCount());
        }
        return totalPrice;
    }

    public List<CartItem> getList() {
        return list;
    }

    public Integer getuId() {
        return uId;
    }
}
