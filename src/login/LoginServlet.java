package login;

import bean.Cart;
import bean.Product;
import bean.User;
import dao.CartDao;
import dao.UserDao;
import dao.impl.CartDaoImpl;
import dao.impl.UserDaoImpl;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 处理登陆请求
 */
public class LoginServlet extends HttpServlet {

    //操作数据库中用户
    private UserDao ud = new UserDaoImpl();

    /**
     * Post请求验证用户名和密码
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //获取请求参数中的用户名和密码
        String uname = request.getParameter("uname");
        String upwd = request.getParameter("upwd");

        //保存用户访问登录页面之前所访问的路径地址，通过这个值可以在用户登录成功之后跳转到登录之前的界面
        //如果获取为字符串"null"，则是从根目录直接跳转过来的，将跳转路径设置为项目路径
        String returnUri = request.getParameter("return_uri").equals("null") ? request.getServletPath() : request.getParameter("return_uri");
        //将第一个/去掉，要不然/将会解析为服务器根目录
        returnUri = returnUri.substring(1);

        //如果参数中有pid，保存到request域中
        if (!request.getParameter("pid").equals("null")) {
            //request.setAttribute("pid", request.getParameter("pid"));
            returnUri += "?pid=" + request.getParameter("pid");
        }

        System.out.println("用户名：==》" + uname);
        System.out.println("密  码：==》" + upwd);
        System.out.println("Return Uri：==》" + returnUri);

        //判断用户名和密码是否为空
        //用户名和密码都不为空则执行登录逻辑
        if (uname == null || upwd == null) {
            request.setAttribute("msg", "用户名或密码为空!!!");
            request.getRequestDispatcher("LoginServlet").forward(request, response);
        }

        //将请求中用户名和密码封装到User对象
        User u = new User(uname, upwd);
        //从数据库中查询用户是否存在
        User u2 = ud.queryUser(u);

        //如果查询成功，则登陆成功，重定向到原来的页面
        if (null != u2) {
            //如果登录成功，则在用户的session对象中保存一个kvflag，值为login_success
            request.getSession().setAttribute("flag", "login_success");
            //将登陆成功用户保存到session域中
            request.getSession().setAttribute("user", u2);
            //重定向到原来的页面
            response.sendRedirect(returnUri);
//            rd = request.getRequestDispatcher("/showProducts.jsp");
//            rd.forward(request, response);
//                //假如用户登录前界面不为空，则跳转到用户登录前界面  
//                //若用户登录前界面为空，则跳转到首页  
//                if (returnUri!=null){  
//                    rd=request.getRequestDispatcher(returnUri);  
//                    rd.forward(request,response);  
//                }else{  
//                    rd=request.getRequestDispatcher("/showProducts.jsp");
//                    rd.forward(request,response);  
//                }  
        } else {
            System.out.println("LoginServlet17判断用户名输入错误");
            //用户查询失败，重新转发回登陆页面

            //设置登陆失败标记
            request.getSession().setAttribute("flag", "login_error");
            //设置错误信息
            request.setAttribute("msg", "用户名或密码输入错误！！！");
            //将输入的用户名和密码回写到登陆页面
            request.setAttribute("user", u);
            //转发到登陆页面
            request.getRequestDispatcher("WEB-INF/pages/login.jsp").forward(request, response);

        }

    }

    /**
     * Get请求转发到登陆页面
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //如果已经登陆，再次登陆则直接跳转到主页
        Object su = request.getSession().getAttribute("user");
        if (null != su) {
            response.sendRedirect(request.getContextPath());
            return;
        }
        //转发到登陆页面
        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }
} 
