package controller;

import facade.FacadeParis;
import facade.exceptions.*;
import modele.Match;
import modele.Pari;
import modele.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;


@WebServlet(name = "pel", urlPatterns = "/pel/*")
public class Controller extends HttpServlet {
    public final static String PAGE_DEFAULT = "/WEB-INF/jsp/connexion.jsp";
    public final static String MENU = "menu";
    public final static String CONNEXION = "connexion";
    public final static String DECONNEXION = "deconnexion";
    public final static String PARISOUVERTS = "parisouverts";
    public final static String MESPARIS = "mesparis";
    public final static String SERVLETNAME = "pel";
    public final static String PARIERMATCH = "pariermatch";
    public final static String PARIER = "parier";
    public final static String ANNULER = "annuler";
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        FacadeParis facadeParis = (FacadeParis) getServletContext().getAttribute("facade");
        String destination = PAGE_DEFAULT;
        String[] chemin = req.getRequestURI().split("/");
        String cleNavigation = chemin[chemin.length-1];
        switch (cleNavigation){
            case CONNEXION:{
                String erreur = "";
                String login = req.getParameter("user_name");
                String password = req.getParameter("user_password");
                Utilisateur utilisateur = null;
                if(login == null || login.length()<2){
                    erreur += "Le nom de l'utilisateur ne peut pas être nul ou il doit être supérieur à 2.\r\n ";
                }
                if (password == null || password.length()<2) {
                    erreur += "Le mot de passe de l'utilisateur doit être supérieur à 2 ou ne peut pas être nul.\r\n ";
                }
                try {
                    utilisateur = facadeParis.connexion(login, password);
                    req.getSession().setAttribute("utilisateur", utilisateur);
                    destination = "/WEB-INF/jsp/menu.jsp";
                } catch (UtilisateurDejaConnecteException e) {
                    destination = PAGE_DEFAULT;
                    erreur += "L'utilisateur " +login+ " est déjà connecté.\r\n ";
                } catch (InformationsSaisiesIncoherentesException e) {
                    destination = PAGE_DEFAULT;
                    erreur += "Login ou mot de passe erroné.\r\n ";
                }
                req.setAttribute("erreur", erreur);
                break;
            }
            case DECONNEXION:{
                Utilisateur utilisateur = (Utilisateur) req.getSession().getAttribute("utilisateur");
                facadeParis.deconnexion(utilisateur.getLogin());
                req.getSession().invalidate();
                destination = PAGE_DEFAULT;
                break;
            }
            case PARISOUVERTS:{
                Collection<Match> matchs = facadeParis.getMatchsPasCommences();
                req.setAttribute("matchs", matchs);
                destination = "/WEB-INF/jsp/parisouverts.jsp";
                break;
            }
            case MESPARIS:{
                Utilisateur utilisateur = (Utilisateur) req.getSession().getAttribute("utilisateur");
                String login = utilisateur.getLogin();
                Collection<Pari> pari = facadeParis.getMesParis(login);
                req.setAttribute("pari", pari);
                destination = "/WEB-INF/jsp/mesparis.jsp";
                break;
            }
            case MENU:{
                destination = "/WEB-INF/jsp/menu.jsp";
                break;
            }
            case PARIERMATCH:{

                Long idMatch = Long.parseLong(req.getParameter("id"));
                Match match = facadeParis.getMatch(idMatch);
                req.getSession().setAttribute("match", match);
                destination = "/WEB-INF/jsp/pariermatch.jsp";
                break;
            }
            case PARIER:{
                Utilisateur utilisateur = (Utilisateur) req.getSession().getAttribute("utilisateur");
                String login = utilisateur.getLogin();
                Match matchs = (Match) req.getSession().getAttribute("match");
                String erreur = "";
                String winner = req.getParameter("verdict");
                Double mise = Double.parseDouble(req.getParameter("mise"));
                try {
                    facadeParis.parier(login, matchs.getIdMatch(), winner, mise);
                    req.setAttribute("winner", winner);
                    req.setAttribute("mise", mise);
                    destination = "/WEB-INF/jsp/confirmerpari.jsp";
                } catch (MontantNegatifOuNulException e) {
                    erreur += "Le montant ne peut pas être nul ou négatif.";
                    destination = "/WEB-INF/jsp/pariermatch.jsp";
                } catch (ResultatImpossibleException e) {
                    erreur += "Résultat impossible.";
                    destination = "/WEB-INF/jsp/pariermatch.jsp";
                } catch (MatchClosException e) {
                    erreur += "Le match est déjà finis.";
                    destination = "/WEB-INF/jsp/pariermatch.jsp";
                }
                req.setAttribute("erreur", erreur);
                break;
            }
            case ANNULER:{
                Utilisateur utilisateur = (Utilisateur) req.getSession().getAttribute("utilisateur");
                String login = utilisateur.getLogin();
                Long idPari = Long.parseLong(req.getParameter("id"));
                Pari pari = facadeParis.getPari(idPari);
                try {
                    facadeParis.annulerPari(login, idPari);
                    req.setAttribute("pari", pari);
                } catch (OperationNonAuthoriseeException e) {
                    e.printStackTrace();
                }
                destination = "/WEB-INF/jsp/confirmerannulation.jsp";
                break;
            }
        }
        req.getServletContext().getRequestDispatcher(destination).forward(req, resp);
    }
}
