<%@ page import="beans.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Comparator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Audio audio = (Audio) request.getAttribute("audio");
  Utente user = (Utente) request.getAttribute("utente");
  Emozioni emozioni = (Emozioni) request.getAttribute("emozioneIA");
  ArrayList<Emozione> lista = new ArrayList<>();
  lista.add(new Emozione("arrabbiato", emozioni.getArrabbiato()));
  lista.add(new Emozione("triste", emozioni.getTriste()));
  lista.add(new Emozione("felice", emozioni.getFelice()));
  lista.add(new Emozione("disgustato", emozioni.getDisgustato()));
  lista.add(new Emozione("sorpreso", emozioni.getSorpreso()));
  lista.add(new Emozione("neutrale", emozioni.getNeutrale()));
  lista.add(new Emozione("impaurito", emozioni.getImpaurito()));
  lista.sort(new Comparator<Emozione>() {
    @Override
    public int compare(Emozione o1, Emozione o2) {
      return o1.getValore() < o2.getValore() ? 1 : -1;
    }
  });
  String file = (String) request.getAttribute("file");
  if(audio == null || user == null || file == null) response.sendRedirect(response.encodeRedirectURL("./audio-control?idAudio="+audio.getIdaudio()));
%>
<html>
<head>
    <title>Video paziente</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
  <link rel="stylesheet" href="styles/bootstrap.css">
</head>
<body>
  <div class="p-0 m-0 h-100">
    <div class="row p-0 m-0 h-100">
      <div class="col-md-2 m-0 p-0 bg-dark-custom">
        <div class="row">
          <div class="col-12 d-flex justify-content-center align-items-center pt-5 pb-4"><img src="img/WakeApp.svg" height="120px" alt="Logo WakeApp"></div>
          <div class="col-12">
            <a href="<%=response.encodeURL("dashboard.jsp")%>" class="btn-menu btn-menu-active w-100"><i class="bi bi-people-fill me-2"></i>Lista pazienti</a>
            <a class="btn-menu w-100"><i class="bi bi-smartwatch me-2"></i>Dispositivi</a>
            <a class="btn-menu w-100"><i class="bi bi-gear me-2"></i>Impostazioni</a>
          </div>
        </div>
      </div>
      <div class="col-md-10 m-0 p-0 bg-img">
        <div class="container-fluid p-5">
          <div class="row mb-4 d-flex align-items-center">
            <div class="col-12"><h6 class="mb-0 color-dark-custom ms-5">Audio</h6></div>
            <div class="col-12 d-flex align-items-center">
              <a class="color-dark-custom text-decoration-none fs-5 d-inline me-2" href="<%=response.encodeURL("paziente.jsp?id="+user.getIdUtente())%>"><i class="bi bi-arrow-left"></i></a>
              <h1 class="color-dark-custom d-inline"><b><%=user.getNome() + " " + user.getCognome()%></b></h1>
            </div>
          </div>

          <!-- Audio -->
          <div class="row bg-violette p-2">
            <div class="col-12 d-flex justify-content-center">
              <audio controls>
                <source src="data:audio/wav;base64,<%=file%>" type="audio/wav">
                Oh no, questo browser non supporta il formato audio... Per favore, riprova con un altro browser!
              </audio>
            </div>
            <div class="col-12"><p class="text-white" id="LblDataRegistrazione">Audio registrato il <%=audio.getData()%> </p></div>
          </div>

          <!-- Emozioni -->
          <div class="row my-4">
            <div class="col-md-6 text-center">
              <%
                switch (audio.getEmozioneutente()) {
                  case "felice":
              %>
              <img src="img/happy.png" alt="Happy" height="120px">
              <%
                  break;
                case "triste":
              %>
              <img src="img/sad.png" alt="Happy" height="120px">
              <%
                  break;
                case "arrabbiato":
              %>
              <img src="img/angry.png" alt="Happy" height="120px">
              <%
                  break;
                case "sorpreso":
              %>
              <img src="img/surprise.png" alt="Happy" height="120px">
              <%
                  break;
                case "disgustato":
              %>
              <img src="img/disgust.png" alt="Happy" height="120px">
              <%
                  break;
                case "neutrale":
              %>
              <img src="img/neutral.png" alt="Happy" height="120px">
              <%
                  break;
                case "impaurito":
              %>
              <img src="img/fear.png" alt="Happy" height="120px">
              <%
                    break;
                }
              %>
              <p class="color-dark-custom fs-4">Utente</p>
            </div>
            <div class="col-md-6 text-center">
              <img src="img/<%=lista.get(0).getNome()%>.png" alt="Sad" height="120px">
              <span class="badge rounded-pill bg-yellow-light color-dark-custom"><%=lista.get(0).getValore()%>%</span>
              <p class="color-dark-custom fs-4">Intelligenza artificiale</p>
            </div>
            <div class="col-12"><h4 class="color-dark-custom">Intelligenza artificiale - probabilità emozioni</h4></div>
            <%
              for (Emozione e:lista) {
            %>
            <div class="col-12 my-2">
              <img src="img/<%=e.getNome()%>.png" alt="<%=e.getNome()%>" height="68px" class="px-2" style="z-index: 100; position: absolute;">
              <div class="progress" style="height: 68px; z-index: 1">
                <div class="progress-bar bg-violette" role="progressbar" aria-label="<%=e.getNome()%>" style="width: <%=e.getValore()%>%;" aria-valuenow="<%=e.getValore()%>" aria-valuemin="0" aria-valuemax="100">
                  <div class="d-flex justify-content-start align-items-center">
                    <p class="color-dark-custom w-100 text-center fs-4 m-0"><%=e.getValore()%>%</p>
                  </div>
                </div>
              </div>
            </div>
            <%
              }
            %>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="scripts/bootstrap.js" rel="script"></script>
</body>
</html>
