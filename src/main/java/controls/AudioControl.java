package controls;

import com.macasaet.fernet.Key;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;

@WebServlet(name = "AudioControl", value = "/audio-control")
public class AudioControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.removeAttribute("audio");
        try {
            String idAudio = request.getParameter("idAudio");
            String keyFake = request.getParameter("key");
            byte[] obj = ServerPY.runFile("/api/audio/play?audio_id="+ idAudio);
            byte[] decrypted = Decryptor.decrypt(keyFake, obj);
            response.setContentType("audio/wav");
            response.setContentLength(decrypted.length);
            OutputStream out = response.getOutputStream();
            out.write(decrypted);
            out.flush();
            out.close();
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
