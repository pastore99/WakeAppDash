package controls;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.security.Security;
import java.util.Arrays;
import java.util.Base64;

public class Decryptor {

    static byte[] decrypt(String keyFake, byte[] data) throws Exception{
        byte[] keyByte = Base64.getUrlDecoder().decode(keyFake);
        byte[] decodedkey = Base64.getUrlDecoder().decode(keyByte);
        byte[] key = Arrays.copyOfRange(decodedkey, 16,decodedkey.length);

        byte[] decoded = Base64.getUrlDecoder().decode(data);

        byte[] iv = Arrays.copyOfRange(decoded, 9, 25);
        byte[] cypertext = Arrays.copyOfRange(decoded, 25, decoded.length-32);

        Security.addProvider(new BouncyCastleProvider());
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS7Padding","BC");
        SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
        IvParameterSpec ivParameterSpec = new IvParameterSpec(iv);
        cipher.init(Cipher.DECRYPT_MODE, secretKey, ivParameterSpec);
        return cipher.doFinal(cypertext);
    }

}
