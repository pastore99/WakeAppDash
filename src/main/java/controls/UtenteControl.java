package controls;

import beans.Audio;
import beans.Utente;
import beans.Video;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

@WebServlet(name = "UtenteControl", value = "/utente-control")
public class UtenteControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.removeAttribute("utente");
        request.removeAttribute("video");
        request.removeAttribute("audio");
        request.removeAttribute("paramentriFisici");
        request.removeAttribute("parametriAmbientali");

        try {
            String id = request.getParameter("id");
            JSONParser parser = new JSONParser();
            Object obj;

            //Utente
            String utenteResult = ServerPY.run("/api/user?user_id=" + id);
            obj = parser.parse(utenteResult);
            Utente utente = ServerPY.parseUtenteObject((JSONObject) obj);
            request.setAttribute("utente", utente);

            //Video
            String videoResult = ServerPY.run("/api/video?user_id=" + id);
            System.out.println(videoResult);
            obj = parser.parse(videoResult);
            JSONArray videoList = (JSONArray) obj;
            Collection<Video> videos = new LinkedList<>();
            videoList.forEach(emp -> videos.add(ServerPY.parseVideoObject((JSONObject) emp)));
            request.setAttribute("video", videos);

            //Audio
            String audioResult = ServerPY.run("/api/audio?user_id=" + id);
            ArrayList<Audio> list = new Gson().fromJson(audioResult, new TypeToken<List<Audio>>(){}.getType());

            request.setAttribute("audio", list);

            //Parametri ambientali
            //URL NOT FOUND ON SERVER PY

            //Parametri vitali
            //URL NOT FOUND ON SERVER PY
        } catch (Exception e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/paziente.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doPost(request, response);
    }
}
