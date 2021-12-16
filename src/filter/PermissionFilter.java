package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by icarus on 2016/5/13.
 * 使用过滤器使得只有登录的用户才能访问hello.jsp
 * -----------------------------------------------
 * 问题：ServletRequest ServletResponse和HttpServletRequest HttpServletResponse的区别
 */
public class PermissionFilter implements Filter {
    public void init(FilterConfig config) {

    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //首先将参数中的ServletRequest和ServletResponse强转为Http...
        HttpServletRequest hreq = (HttpServletRequest) req;
        HttpServletResponse hresp = (HttpServletResponse) resp;

        //获取请求中的Servletpath
        String servletpath = hreq.getServletPath();
        hreq.setAttribute("return_uri", servletpath);

        //获取请求中的pid，如果存在
        if (req.getParameter("pid") != null) {
            hreq.setAttribute("pid", req.getParameter("pid"));
        }

        //获取session对象
        HttpSession hsess = hreq.getSession();
        //获取session对象中flag的值，强转为String类型
        String flag = (String) hsess.getAttribute("flag");

        // 将请求直接转发给下一个组件进行处理
        //对于其他请求则都进行权限校验
        //放行静态资源和指定的请求
        List<String> url = new ArrayList<>();
        url.add("/index.jsp");
        url.add("/LoginServlet");
        url.add("/SearchServlet");
        url.add("/DetailsServlet");


        if (servletpath != null && (url.contains(servletpath) || servletpath.startsWith("/static"))) {
            System.out.println("filter判断：不用登陆的请求：" + servletpath);
            chain.doFilter(req, resp);
        } else {
            //用户处于登录状态则可以直接进行访问
            if (flag != null && flag.equals("login_success")) {
                System.out.println("filter判断：登陆成功状态");
                chain.doFilter(req, resp);
                //登录失败,则跳转到登录界面
            } else if (flag != null && flag.equals("login_error")) {
                hreq.setAttribute("msg", "登录失败状态，请重新登录!!!");

                hreq.getRequestDispatcher("/LoginServlet").forward(hreq, hresp);
                //没有登录则将请求转发给登陆方法，并提示“您尚未登录！！！”
            } else {
                hreq.setAttribute("msg", "您尚未登录！！！");
                hreq.getRequestDispatcher("/LoginServlet").forward(hreq, hresp);
                System.out.println("filter判断：尚未登陆");
            }
        }
    }

    public void destroy() {
    }

}