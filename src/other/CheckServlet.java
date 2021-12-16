package other;

import bean.Cart;
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

public class CheckServlet extends HttpServlet {
    //购物车DAO
    private CartDao cd = new CartDaoImpl();

    //产品DAO
    private ProductDao pd=new ProductDaoImpl();

    @Override
    //使用doGet方法
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        String pid = req.getParameter("pid");
        Cart cart;
        if (pid != null) {
            cart = new Cart(user.getuId());
            cart.addProductToCart(pd.queryProductById(Integer.parseInt(pid)));
        } else {
            cart = cd.getCartByUserId(user.getuId());
        }
        req.setAttribute("cart", cart);
        req.getRequestDispatcher("WEB-INF/pages/check.jsp").forward(req, resp);
    }
}
