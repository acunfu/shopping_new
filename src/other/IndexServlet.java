package other;

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
import java.util.List;


/**
 * 处理主页请求
 */
public class IndexServlet extends HttpServlet {

    //操作数据库中产品
    private ProductDao pd = new ProductDaoImpl();
    //购物车DAO
    private CartDao cd = new CartDaoImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //查询到所有产品，并添加到请求域中，在首页显示
        List<Product> list = pd.queryAllProduct();
        req.setAttribute("list", list);
        req.getRequestDispatcher("WEB-INF/pages/showProducts.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
