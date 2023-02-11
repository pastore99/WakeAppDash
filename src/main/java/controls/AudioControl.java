package controls;

import beans.Audio;
import beans.Utente;
import beans.Video;
import com.macasaet.fernet.Key;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.security.Security;
import java.util.*;

@WebServlet(name = "AudioControl", value = "/audio-control")
public class AudioControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.removeAttribute("audio");
        try {
            JSONParser parser = new JSONParser();
            Object obj;

            String idUtente = request.getParameter("idUtente");
            String utenteResult = ServerPY.run("/api/user?id=" + idUtente);
            obj = parser.parse(utenteResult);
            Utente utente = ServerPY.parseUtenteObject((JSONObject) obj);
            request.setAttribute("utente", utente);

            String idAudio = request.getParameter("idAudio");
            String audioResult = ServerPY.run("/api/audio?user_id=" + idUtente);
            obj = parser.parse(audioResult);
            JSONArray audioList = (JSONArray) obj;
            Collection<Audio> audio = new LinkedList<>();
            audioList.forEach(emp -> audio.add(ServerPY.parseAudioObject((JSONObject) emp)));
            for (Audio a:audio) {
                if (a.getIdAudio() == Integer.parseInt(idAudio)) {
                    request.setAttribute("audio", a);
                    break;
                }
            }

            String keyFake = request.getParameter("key");
            byte[] obj2 = ServerPY.runFile("/api/audio/play?audio_id="+ idAudio);
            byte[] decrypted = Decryptor.decrypt(keyFake, obj2);
            String b64 = Base64.getEncoder().encodeToString(decrypted);
            request.setAttribute("file", b64);
        }catch (Exception e){
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/audio.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request,response);
    }
}
