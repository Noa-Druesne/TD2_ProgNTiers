package controller;

import facade.FacadeParis;
import facade.exceptions.*;
import modele.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "admin", urlPatterns = "/admin/*")
public class Admin extends HttpServlet {
    public final static String PAGE_DEFAULT = "/WEB-INF/jsp/connexion.jsp";
    public final static String AJOUTERMATCH = "ajoutermatch";
    public final static String NOUVEAUMATCH = "nouveaumatch";
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        FacadeParis facadeParis = (FacadeParis) getServletContext().getAttribute("facade");
        String destination = PAGE_DEFAULT;
        String[] chemin = req.getRequestURI().split("/");
        String cleNavigation = chemin[chemin.length-1];
        switch (cleNavigation){
            case AJOUTERMATCH:{
                Utilisateur utilisateur = (Utilisateur) req.getSession().getAttribute("utilisateur");
                String login = utilisateur.getLogin();
                String erreur = "";
                String sport = req.getParameter("sport");
                String equipe1 = req.getParameter("equipe1");
                String equipe2 = req.getParameter("equipe2");
                String date = req.getParameter("date");
                String heure = req.getParameter("heure");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
                LocalDateTime quand = LocalDateTime.parse(date+ " "+heure, formatter);
                try {
                    facadeParis.ajouterMatch(login, sport, equipe1, equipe2, quand);
                    destination = "/WEB-INF/jsp/menu.jsp";
                } catch (UtilisateurNonAdminException e) {
                    erreur += "L'utilisateur connecté n'est pas un admin.";
                    destination = "/WEB-INF/jsp/menu.jsp";
                }
                req.setAttribute("erreur", erreur);
                break;
            }
            case NOUVEAUMATCH: {
                destination = "/WEB-INF/jsp/nouveaumatch.jsp";
                break;
            }
        }
        req.getServletContext().getRequestDispatcher(destination).forward(req, resp);
    }
}
