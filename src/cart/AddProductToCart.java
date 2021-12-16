package cart;

import bean.Cart;
import bean.Product;
import bean.User;
import dao.CartDao;
import dao.ProductDao;
import dao.impl.CartDaoImpl;
import dao.impl.ProductDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 接收购物车添加产品请求
 */
public class AddProductToCart extends HttpServlet {

    /**
     * 产品操作DAO
     */
    private ProductDao pd = new ProductDaoImpl();

    //购物车DAO
    private CartDao cd = new CartDaoImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //通过产品id，从数据库查出产品，添加到购物车
        String pid = req.getParameter("pid");
        if (pid != null) {
            Product p = pd.queryProductById(Integer.parseInt(pid));
            User u = (User) req.getSession().getAttribute("user");
            Cart cart = cd.getCartByUserId(u.getuId());
            cart.addProductToCart(p);
        }
        resp.sendRedirect("CartServlet");
    }
}
