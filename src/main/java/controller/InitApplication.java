package controller;

import facade.FacadeParis;
import facade.FacadeParisStaticImpl;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class InitApplication implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent){
        FacadeParis facadeParis = new FacadeParisStaticImpl();
        servletContextEvent.getServletContext().setAttribute("facade", facadeParis);
        servletContextEvent.getServletContext().setAttribute("applicationName", Controller.SERVLETNAME);
    }
    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent){
        servletContextEvent.getServletContext().setAttribute("facade", null);
    }
}
