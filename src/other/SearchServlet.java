package other;

import bean.Product;
import dao.ProductDao;
import dao.impl.ProductDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class SearchServlet extends HttpServlet {
    //查找数据库中的产品
    private ProductDao pd = new ProductDaoImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String key = req.getParameter("key");
        List<Product> list = null;
        if (key == null || key.equals("")) {
            resp.sendRedirect(req.getContextPath());
            return;
        }
        list = pd.queryProductByKey(key);
        if (list.size() < 1) {
            list = pd.queryAllProduct();
            req.setAttribute("info","没有查到此产品");
        }
        req.setAttribute("list", list);
        req.getRequestDispatcher("/WEB-INF/pages/showProducts.jsp").forward(req, resp);
    }
}
