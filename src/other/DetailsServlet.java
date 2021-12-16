package other;

import bean.Product;
import dao.ProductDao;
import dao.impl.ProductDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DetailsServlet extends HttpServlet {
    //操作数据库中产品
    private ProductDao pd = new ProductDaoImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pid = req.getParameter("pid");
        if (pid == null) {
            resp.sendRedirect(req.getContextPath());
            return;
        }

        req.setAttribute("product", pd.queryProductById(Integer.parseInt(pid)));
        req.getRequestDispatcher("WEB-INF/pages/details.jsp").forward(req, resp);
    }

}
