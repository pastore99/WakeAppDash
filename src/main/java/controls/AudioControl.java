package controls;

import beans.Audio;
import beans.Emozioni;
import beans.Utente;
import beans.Video;
import com.google.gson.Gson;
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
        super.doGet(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String u = new String(Base64.getUrlDecoder().decode(request.getParameter("InputUser")), StandardCharsets.UTF_8);
            Utente utente = new Gson().fromJson(u, Utente.class);
            String a = new String(Base64.getUrlDecoder().decode(request.getParameter("InputAudio")), StandardCharsets.UTF_8);
            Audio audio = new Gson().fromJson(a, Audio.class);

            JSONParser parser = new JSONParser();
            String app = audio.getEmozioneia().replace("\'", "\"");
            Object obj2 = parser.parse(app);
            Emozioni emozioneIA = ServerPY.parseEmozioniObject((JSONObject) obj2);

            String keyFake = Base64.getUrlEncoder().encodeToString(utente.getKey().getBytes(StandardCharsets.UTF_8));
            byte[] obj = ServerPY.runFile("/api/audio/play?audio_id="+ audio.getIdaudio());
            byte[] decrypted = Decryptor.decrypt(keyFake, obj);
            String b64 = Base64.getEncoder().encodeToString(decrypted);
            request.setAttribute("emozioneIA", emozioneIA);
            request.setAttribute("utente", utente);
            request.setAttribute("audio", audio);
            request.setAttribute("file", b64);
        }catch (Exception e){
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/audio.jsp");
        dispatcher.forward(request, response);
    }
}
