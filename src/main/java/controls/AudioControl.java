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
import java.security.SecureRandom;
import java.security.Security;
import java.util.Base64;

@WebServlet(name = "AudioControl", value = "/audio-control")
public class AudioControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.removeAttribute("audio");
        try {
            Object obj;
            String idAudio = request.getParameter("idAudio");
            obj = ServerPY.run("/api/audio/play?audio_id="+ idAudio);

            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ObjectOutputStream oos = new ObjectOutputStream(baos);
            oos.writeObject(obj);
            oos.flush();
            byte[] byteArray = baos.toByteArray();

            Security.addProvider(new BouncyCastleProvider());
            String encodedString = "GUTdbvcDC4bJV0v5b2-H4zSyQde8AnHzG4zWgJ7ra9w=".replace("-","/");
            byte[] key = Base64.getDecoder().decode(encodedString.getBytes("UTF-8"));
            byte[] iv = new byte[16];
            for (int i=9, z=0; i<25; i++, z++) {
                iv[z] = byteArray[i];
            }
            IvParameterSpec ivParameterSpec = new IvParameterSpec(iv);
            SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS7Padding","BC");
            cipher.init(Cipher.DECRYPT_MODE, secretKey, ivParameterSpec);
            byte[] decryptedData = cipher.doFinal(byteArray);
            request.setAttribute("audio",decryptedData);

        }catch (Exception e){
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/provola.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request,response);
    }
}
