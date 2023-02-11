package controls;

import beans.Emozioni;
import beans.Utente;
import beans.Video;
import com.google.gson.Gson;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

@WebServlet(name = "VideoControl", value = "/video2-control")
public class Video2Control extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Utente utente = new Gson().fromJson(request.getParameter("InputUtente"), Utente.class);
            Video video = new Gson().fromJson(request.getParameter("InputVideo"), Video.class);

            String keyFake = Base64.getUrlEncoder().encodeToString(utente.getKey().getBytes(StandardCharsets.UTF_8));
            byte[] obj = ServerPY.runFile("/api/video/play?video_id="+ video.getIdVideo());
            byte[] decrypted = Decryptor.decrypt(keyFake, obj);
            String b64 = Base64.getEncoder().encodeToString(decrypted);
            request.setAttribute("utente", utente);
            request.setAttribute("video", video);
            request.setAttribute("file", b64);
        }catch (Exception e){
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/video.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String u = new String(Base64.getUrlDecoder().decode(request.getParameter("InputUser")), StandardCharsets.UTF_8);
            Utente utente = new Gson().fromJson(u, Utente.class);
            String v = new String(Base64.getUrlDecoder().decode(request.getParameter("InputVideo")), StandardCharsets.UTF_8);
            Video video = new Gson().fromJson(v, Video.class);

            JSONParser parser = new JSONParser();
            String app = video.getEmozioneIa().replace("\'", "\"");
            Object obj2 = parser.parse(app);
            Emozioni emozioneIA = ServerPY.parseEmozioniObject((JSONObject) obj2);

            String keyFake = Base64.getUrlEncoder().encodeToString(utente.getKey().getBytes(StandardCharsets.UTF_8));
            byte[] obj = ServerPY.runFile("/api/video/play?video_id="+ video.getIdVideo());
            byte[] decrypted = Decryptor.decrypt(keyFake, obj);
            String b64 = Base64.getEncoder().encodeToString(decrypted);
            request.setAttribute("emozioneIA", emozioneIA);
            request.setAttribute("utente", utente);
            request.setAttribute("video", video);
            request.setAttribute("file", b64);
        }catch (Exception e){
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/video.jsp");
        dispatcher.forward(request, response);
    }
}
