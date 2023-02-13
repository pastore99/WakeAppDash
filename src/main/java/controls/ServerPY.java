package controls;

import beans.Audio;
import beans.Emozioni;
import beans.Utente;
import beans.Video;
import okhttp3.*;
import org.json.simple.JSONObject;

public class ServerPY {
    static OkHttpClient client = new OkHttpClient();
    private static String url = "http://127.0.0.1:5000";
    private static String token = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY3MTIwODA5NSwianRpIjoiYmE4NDVkNTAtZGE5Ni00N2Q4LWE1NmItNTY0MjkxZGYxNDVhIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6InRlc3QxQGdtYWlsLmNvbSIsIm5iZiI6MTY3MTIwODA5NX0.ZDfA5LfmvtmoigWz4Fqww3yKlhkJKbcHysi7intLwKo";

    public static String getServerURL() {
        return url;
    }

    public static byte[] runFile(String urlPath) {
        try {

            Request request = new Request.Builder()
                    .url(url + urlPath)
                    .addHeader("Authorization", token)
                    .addHeader("Content-Type", "application/octet-stream")
                    .build();

            Response response = client.newCall(request).execute();
            return response.body().bytes();
        } catch (Exception e) {
            return new byte[0];
        }
    }
    public static String run(String urlPath) {

        try {

            Request request = new Request.Builder()
                    .url(url + urlPath)
                    .addHeader("Authorization", token)
                    .addHeader("Content-Type","application/json; charset=utf-8")
                    .build();

            Response response = client.newCall(request).execute();

            String message = response.body().string();

            return message;
        } catch (Exception e) {
            e.printStackTrace();
            return "Error: " + e.getMessage();
        }
    }

    public static Utente parseUtenteObject(JSONObject utente) {
        Utente bean = new Utente();
        bean.setEmail((String) utente.get("email"));
        bean.setTelefono((String) utente.get("telefono"));
        bean.setCognome((String) utente.get("cognome"));
        String dataString = (String) utente.get("data_di_nascita");
        //Date dataDate = new Date(Integer.parseInt(dataString.substring(0, 4)), Integer.parseInt(dataString.substring(6, 2)), Integer.parseInt(dataString.substring(8, 2)));
        bean.setDataDiNascita(dataString);
        bean.setCodiceFiscale((String) utente.get("cf"));
        bean.setResidenza((String) utente.get("residenza"));
        bean.setIdUtente((String) utente.get("idutente"));
        bean.setPassword((String) utente.get("password"));
        bean.setNome((String) utente.get("nome"));
        bean.setKey((String) utente.get("key"));
        Long l = (long) utente.get("tipo");
        bean.setTipo(l.intValue());
        return bean;
    }

    public static Video parseVideoObject(JSONObject video) {
        Video bean = new Video();
        Long l = (long) video.get("idVideo");
        bean.setIdVideo(l.intValue());
        bean.setData((String) video.get("data"));
        l = (long) video.get("durata");
        bean.setDurata(l.intValue());
        bean.setEmozioneIa((String) video.get("emozioneIA"));
        bean.setEmozioneUtente((String) video.get("emozioneUtente"));
        bean.setOra((String) video.get("ora"));
        bean.setIdUtente((String) video.get("idUtente"));
        bean.setPath((String) video.get("path"));
        bean.setStatus((String) video.get("status"));
        return bean;
    }

    public static Emozioni parseEmozioniObject(JSONObject emozioni) {
        Emozioni bean = new Emozioni();
        bean.setArrabbiato(fromExpToInteger((Double) emozioni.get("angry")));
        bean.setFelice(fromExpToInteger((Double) emozioni.get("happy")));
        bean.setNeutrale(fromExpToInteger((Double) emozioni.get("neutral")));
        bean.setDisgustato(fromExpToInteger((Double) emozioni.get("disgust")));
        bean.setImpaurito(fromExpToInteger((Double) emozioni.get("fear")));
        bean.setTriste(fromExpToInteger((Double) emozioni.get("sad")));
        bean.setSorpreso(fromExpToInteger((Double) emozioni.get("surprise")));
        return bean;
    }

    public static Audio parseAudioObject(JSONObject audio) {
        Audio bean = new Audio();
        Long l = (long) audio.get("idaudio");
        bean.setIdAudio(l.intValue());
        String dataString = (String) audio.get("data");
        bean.setData(dataString);
        l = (long) audio.get("durata");
        bean.setDurata(l.intValue());
        bean.setEmozioneIa((String) audio.get("emozioneIA"));
        bean.setEmozioneUtente((String) audio.get("emozioneUtente"));
        bean.setIdTesto((String) audio.get("idtesto"));
        bean.setIdUtente((String) audio.get("idUtente"));
        bean.setPath((String) audio.get("path"));
        return bean;
    }

    //Type = "Video" or "Audio"
    public static Boolean sendNotifications(String urlPath, String type) {
        try {
            RequestBody formBody = new FormBody.Builder()
                    .add("type", type)
                    .build();

            Request request = new Request.Builder()
                    .url(url + urlPath)
                    .addHeader("Authorization", token)
                    .post(formBody)
                    .build();

            Response response = client.newCall(request).execute();
            return response.code() == 200 || response.code() == 201;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    static int fromExpToInteger(Double num) {
        String s = String.format("%.2f", num);
        s = s.replace(",", ".");
        num = Double.parseDouble(s);
        return (int) (num*100);
    }
}
