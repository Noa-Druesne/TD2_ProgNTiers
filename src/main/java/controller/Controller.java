package controller;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "pel", urlPatterns = "/pel/*")
public class Controller extends HttpServlet {
    public final static String PAGE_DEFAULT = "/WEB-INF/jsp/connexion.jsp";
    public final static String MENU = "menu";
    public final static String CONNEXION = "connexion";
    public final static String DECONNEXION = "deconnexion";
    public final static String PARISOUVERTS = "parisouverts";
    public final static String MESPARIS = "mesparis";
    public final static String SERVLETNAME = "pel";
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String destination = PAGE_DEFAULT;
        String[] chemin = req.getRequestURI().split("/");
        String cleNavigation = chemin[chemin.length-1];
        switch (cleNavigation){
            case CONNEXION:{
                destination = "/WEB-INF/jsp/connexion.jsp";
                break;
            }
            case DECONNEXION:{
                destination = PAGE_DEFAULT;
                break;
            }
            case PARISOUVERTS:{
                destination = "/WEB-INF/jsp/parisouverts.jsp";
                break;
            }
            case MESPARIS:{
                destination = "/WEB-INF/jsp/mesparis.jsp";
                break;
            }
            case MENU:{
                destination = "/WEB-INF/jsp/menu.jsp";
                break;
            }
        }
        req.getServletContext().getRequestDispatcher(destination).forward(req, resp);
    }
}
