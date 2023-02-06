package controls;

import org.json.simple.parser.JSONParser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AudioControl", value = "/audio-control")
public class AudioControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.removeAttribute("audio");
        try {
            Object obj;
            String idAudio = request.getParameter("idAudio");
            obj = ServerPY.run("/api/audio/play?audio_id="+ idAudio);
            request.setAttribute("audio",obj);
        }catch (Exception e){
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("audio.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request,response);
    }
}
