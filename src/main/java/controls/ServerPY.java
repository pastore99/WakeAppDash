package controls;

import beans.Audio;
import beans.Emozioni;
import beans.Utente;
import beans.Video;
import okhttp3.*;
import org.json.simple.JSONObject;

public class ServerPY {
    static OkHttpClient client = new OkHttpClient();
    private static String url = "https://512d9102cfa78b.lhr.life";
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

        /*
        {'emozioneutente': 'arrabbiato', 'idaudio': 16, 'data': '13/02/2023', 'path': './audio/07df3fcd-e1c5-48e3-8ae2-9f1b10a7cb8c/audio.mp4.wav', 'idutente': '07df3fcd-e1c5-48e3-8ae2-9f1b10a7cb8c', 'emozioneia': '{\n    "neutral": 0.22889856417145402,\n    "disgust": 3.1267005836508876e-10,\n    "happy": 0.025210834611275282,\n    "fear": 5.5160274247648624e-08,\n    "angry": 0.06109114589200261,\n    "surprise": 0.6847993998523239,\n    "sad": 7.934524247686946e-21\n}', 'durata': 10, 'idtesto': '1'}
         */

        Audio bean = new Audio();
        String l = (String) audio.get("idaudio");
        bean.setIdaudio(l);
        String dataString = (String) audio.get("data");
        bean.setData(dataString);
        long dl = (long) audio.get("durata");
        bean.setDurata(dl);
        bean.setEmozioneia((String) audio.get("emozioneia"));
        bean.setEmozioneutente((String) audio.get("emozioneutente"));
        bean.setIdtesto((String) audio.get("idtesto"));
        bean.setIdutente((String) audio.get("idutente"));
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
        num *= 100;
        if (num > 95) num = 94.0;
        return num.intValue();
    }
}
