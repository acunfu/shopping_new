package bean;



/**
 * 购物车商品类
 * @Author Mr.A
 * @Description //TODO lenovo
 * @Param
 * @return
 **/

public class CartItem {
    private Product product;
    private Integer count;


    public CartItem() {
    }

    public CartItem(Product p, Integer count) {
        this.product = p;
        this.count = count;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Double getPrice() {
        return product.getpPrice() * count;
    }

    @Override
    public String toString() {
        return "CartItem{" +
                "p=" + product +
                ", count=" + count +
                '}';
    }

}
