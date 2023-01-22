package controls;

import beans.Utente;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;
import java.sql.Date;
import java.util.LinkedList;

@WebServlet(name = "utentiControl", value = {"/utenti-control"})
public class UtentiControl extends HttpServlet {
    public UtentiControl() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.removeAttribute("utenti");
        try {
            String result = ServerPY.run("/api/user/all");
            JSONParser parser = new JSONParser();
            Object obj = parser.parse(result);
            JSONArray utentiList = (JSONArray) obj;
            Collection<Utente> utenti = new LinkedList<>();
            utentiList.forEach(emp -> utenti.add(ServerPY.parseUtenteObject((JSONObject) emp)));
            req.setAttribute("utenti", utenti);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/dashboard.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }



}
