package listener;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;
import utils.JDBCUtils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

/**
 * 服务停止前，关闭数据库连接池，注销驱动，关闭连接线程
 */
public class DriverManagerListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

        //关闭Druid连接池
        DruidDataSource ds = (DruidDataSource) JDBCUtils.getDataSource();
        ds.close();

        //注销所有Driver
        Enumeration<Driver> drivers = DriverManager.getDrivers();
        while(drivers.hasMoreElements()){
            try {
                Driver driver = drivers.nextElement();
                DriverManager.deregisterDriver(driver);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        //关闭MySql连接
        AbandonedConnectionCleanupThread.uncheckedShutdown();
    }
}
