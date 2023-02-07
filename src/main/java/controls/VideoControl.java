package controls;

import beans.Emozioni;
import beans.Utente;
import beans.Video;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet(name = "VideoControl", value = "/video-control")
public class VideoControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.removeAttribute("utente");
        request.removeAttribute("video");
        String keyFake = request.getParameter("key");
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

            String jsonEmozioniIA = video.getEmozioneIa();
            obj = parser.parse(jsonEmozioniIA);
            Emozioni emozioneIA = ServerPY.parseEmozioniObject((JSONObject) obj);
            request.setAttribute("emozioniIA", emozioneIA);

            String jsonEmozioniUtente = video.getEmozioneUtente();
            obj = parser.parse(jsonEmozioniUtente);
            Emozioni emozioneUtente = ServerPY.parseEmozioniObject((JSONObject) obj);
            request.setAttribute("emozioniUtente", emozioneUtente);

            byte[] bytes = ServerPY.runFile("/api/video/play?video_id="+ idVideo);
            byte[] decrypted = Decryptor.decrypt(keyFake, bytes);
            response.setContentType("video/mp4");
            response.setContentLength(decrypted.length);
            OutputStream out = response.getOutputStream();
            out.write(decrypted);
            out.flush();
            out.close();

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
