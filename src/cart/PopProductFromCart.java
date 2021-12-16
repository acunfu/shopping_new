package cart;

import bean.Cart;
import bean.CartItem;
import bean.User;
import dao.CartDao;
import dao.impl.CartDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 处理购物车中增加产品数量请求
 */
public class PopProductFromCart extends HttpServlet {
    //购物车DAO
    private CartDao cd = new CartDaoImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //从请求中获取产品id，遍历购物车，查找到之后将购物车中产品减1
        String pid = req.getParameter("pid");
        if (null != pid) {
            User u = (User) req.getSession().getAttribute("user");
            Cart cart = cd.getCartByUserId(u.getuId());
            cart.deleteProductFromCart(Integer.parseInt(pid));
        }
        resp.sendRedirect("CartServlet");
    }
}
