package cart;

import bean.Cart;
import bean.User;
import dao.CartDao;
import dao.impl.CartDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * 处理从购物车删除产品请求
 */
public class DeleteProductFromCart extends HttpServlet {

    //购物车DAO
    private CartDao cd = new CartDaoImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //从请求中获取产品id，通过产品id从购物车中删除产品
        String pid = req.getParameter("pid");
        if (null != pid) {
            User u = (User) req.getSession().getAttribute("user");
            Cart cart = cd.getCartByUserId(u.getuId());
            cart.deleteProductItemFromCart(Integer.parseInt(pid));
        }

        resp.sendRedirect("CartServlet");
    }
}
