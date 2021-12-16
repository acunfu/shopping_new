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
 * 接收购物车主页请求，将请求转发到购物车jsp页面
 */
public class CartServlet extends HttpServlet {


    //购物车DAO
    private CartDao cd = new CartDaoImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //从Session域中获取用户信息，如果没有获取到，则转发到登陆页面
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect("LoginServlet");
        }
        //登陆成功，从数据库中获取用户的购物车数据，放到request域中
        Cart cart = cd.getCartByUserId(user.getuId());
        req.setAttribute("cart", cart);

        req.getRequestDispatcher("/WEB-INF/pages/buy.jsp").forward(req, resp);
    }
}
