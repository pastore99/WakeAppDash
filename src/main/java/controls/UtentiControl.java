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
    OkHttpClient client = new OkHttpClient();
    public UtentiControl() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.removeAttribute("utenti");
        try {
            String result = run("https://8d2074ee71a331.lhr.life/api/user/all", "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY3MTIwODA5NSwianRpIjoiYmE4NDVkNTAtZGE5Ni00N2Q4LWE1NmItNTY0MjkxZGYxNDVhIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6InRlc3QxQGdtYWlsLmNvbSIsIm5iZiI6MTY3MTIwODA5NX0.ZDfA5LfmvtmoigWz4Fqww3yKlhkJKbcHysi7intLwKo");
            JSONParser parser = new JSONParser();
            result = result.replace("\\", "");
            result = result.replaceFirst("\"", "");
            result = result.substring(0, result.length()-2);
            Object obj = parser.parse(result);
            JSONArray utentiList = (JSONArray) obj;
            Collection<Utente> utenti = new LinkedList<>();
            utentiList.forEach(emp -> utenti.add(parseUtenteObject((JSONObject) emp)));
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

    String run(String url, String token) throws IOException {
        Request request = new Request.Builder()
                .url(url)
                .addHeader("Authorization", token)
                .build();

        try (Response response = client.newCall(request).execute()) {
            return response.body().string();
        } catch (Exception e) {
            return "Error: " + e.getMessage();
        }
    }

    private Utente parseUtenteObject(JSONObject utente) {
        Utente bean = new Utente();
        bean.setEmail((String) utente.get("email"));
        bean.setTelefono((String) utente.get("telefono"));
        bean.setCognome((String) utente.get("cognome"));
        //bean.setDataDiNascita((Date) utente.get("data_di_nascita"));
        bean.setCodiceFiscale((String) utente.get("cf"));
        bean.setResidenza((String) utente.get("residenza"));
        bean.setIdUtente((String) utente.get("idutente"));
        bean.setPassword((String) utente.get("password"));
        bean.setNome((String) utente.get("nome"));
        bean.setKey((String) utente.get("key"));
        Long l = (long) utente.get("tipo");
        bean.setTipo(l.intValue());
        return bean;
    }

}
