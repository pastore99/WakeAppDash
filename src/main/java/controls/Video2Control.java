package controls;

import beans.Utente;
import beans.Video;
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

@WebServlet(name = "VideoControl", value = "/video2-control")
public class Video2Control extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            String idVideo = request.getParameter("idVideo");
            String keyFake = request.getParameter("key");
            byte[] obj = ServerPY.runFile("/api/video/play?video_id="+ idVideo);

            byte[] decrypted = Decryptor.decrypt(keyFake, obj);

            response.setContentType("video/mp4");
            response.setContentLength(decrypted.length);
            OutputStream out = response.getOutputStream();
            out.write(decrypted);
            out.flush();
            out.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/provola.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
    }
}
