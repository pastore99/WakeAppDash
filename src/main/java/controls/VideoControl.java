package controls;

import beans.Utente;
import beans.Video;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "VideoControl", value = "/video-control")
public class VideoControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.removeAttribute("utente");
        request.removeAttribute("video");
        try {
            JSONParser parser = new JSONParser();
            Object obj;

            String idUtente = request.getParameter("idUtente");
            String utenteResult = ServerPY.run("/api/user?id=" + idUtente);
            obj = parser.parse(utenteResult);
            Utente utente = ServerPY.parseUtenteObject((JSONObject) obj);
            request.setAttribute("utente", utente);

            String idVideo = request.getParameter("idVideo");
            String videoResult = ServerPY.run("/api/video?id=" + idVideo);
            obj = parser.parse(videoResult);
            Video video = ServerPY.parseVideoObject((JSONObject) obj);
            request.setAttribute("video", video);

            /* Intelligenza artificiale - prob. emozioni
            * come recuperare le percentuali relative alla emozioni (tristezza-incazzatura-allegeria-felicita)
            * */
        } catch (Exception e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("video.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
    }
}
