<%@ page import="beans.Video" %>
<%@ page import="beans.Utente" %>
<%@ page import="beans.Emozioni" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String idUtente = request.getParameter("idUtente");
  String idVideo = request.getParameter("idVideo");
  Video video = (Video) request.getAttribute("video");
  Utente user = (Utente) request.getAttribute("utente");
  Emozioni emozioniIA = (Emozioni) request.getAttribute("emozioniIA");
  Emozioni emozioniUtente = (Emozioni) request.getAttribute("emozioniUtente");
  if(video == null || user == null || emozioniIA == null || emozioniUtente == null) response.sendRedirect(response.encodeRedirectURL("./video-control?idUtente="+idUtente+"&idVideo="+idVideo));
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
      <div class="col-md-1 m-0 p-0 border-1 border-end">
        <div class="row">
          <div class="col-12 d-flex justify-content-center align-items-center pt-5 pb-4"><img src="img/WakeApp.svg" height="120px" alt="Logo WakeApp"></div>
          <div class="col-12">
            <a href="<%=response.encodeURL("dashboard.jsp")%>" class="btn-menu btn-menu-active w-100"><i class="bi bi-people-fill me-2"></i>Lista pazienti</a>
            <a class="btn-menu w-100"><i class="bi bi-smartwatch me-2"></i>Dispositivi</a>
            <a class="btn-menu w-100"><i class="bi bi-gear me-2"></i>Impostazioni</a>
          </div>
        </div>
      </div>
      <div class="col-md-11 m-0 p-0 bg-img">
        <div class="container-fluid p-5">
          <div class="row mb-4 d-flex align-items-center">
            <div class="col-12"><h6 class="mb-0 color-dark-custom ms-5">Video</h6></div>
            <div class="col-12 d-flex align-items-center">
              <a class="color-dark-custom text-decoration-none fs-5 d-inline me-2" href="<%=response.encodeURL("paziente.jsp?id="+user.getIdUtente())%>"><i class="bi bi-arrow-left"></i></a>
              <h1 class="color-dark-custom d-inline"><b><%=user.getNome() + " " + user.getCognome()%></b></h1>
            </div>
          </div>

          <!-- Video -->
          <div class="row bg-violette p-2">
            <div class="col-12 d-flex justify-content-center">
              <video width="1280" height="720" controls>
                <source src="movie.mp4" type="video/mp4">
                Oh no, questo browser non supporta il formato video... Per favore, riprova con un altro browser!
              </video>
            </div>
            <div class="col-12"><p class="text-white" id="LblDataRegistrazione">Video registrato il <%=video.getData()%> alle <%=video.getOra()%></p></div>
          </div>

          <!-- Emozioni -->
          <div class="row my-4">
            <div class="col-md-6 text-center">
              <img src="img/Happy.svg" alt="Happy" height="120px">
              <p class="color-dark-custom fs-4">Utente</p>
            </div>
            <div class="col-md-6 text-center">
              <img src="img/Sad.svg" alt="Sad" height="120px">
              <span class="badge rounded-pill bg-yellow-light color-dark-custom">100%</span>
              <p class="color-dark-custom fs-4">Intelligenza artificiale</p>
            </div>
            <div class="col-12"><h4 class="color-dark-custom">Intelligenza artificiale - probabilità emozioni</h4></div>
            <div class="col-12 my-2">
              <div class="progress" style="height: 68px;">
                <div class="progress-bar bg-violette" role="progressbar" aria-label="Triste" style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
                  <div class="d-flex justify-content-start align-items-center">
                    <img src="img/Sad.svg" alt="Sad" height="60px" class="px-2">
                    <p class="color-dark-custom w-100 text-center fs-4 m-0" id="LblProgessTriste">100%</p>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-12 my-2">
              <div class="progress" style="height: 68px;">
                <div class="progress-bar bg-violette" role="progressbar" aria-label="Arrabbiato" style="width: 68%;" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
                  <div class="d-flex justify-content-start align-items-center">
                    <img src="img/Angry.svg" alt="Sad" height="60px" class="px-2">
                    <p class="color-dark-custom w-100 text-center fs-4 m-0" id="LblProgessArrabbiato">68%</p>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-12 my-2">
              <div class="progress" style="height: 68px;">
                <div class="progress-bar bg-violette" role="progressbar" aria-label="Felice" style="width: 22%;" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100">
                  <div class="d-flex justify-content-start align-items-center">
                    <img src="img/Happy.svg" alt="Sad" height="60px" class="px-2">
                    <p class="color-dark-custom w-100 text-center fs-4 m-0" id="LblProgessFelice">22%</p>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-12 my-2">
              <div class="progress" style="height: 68px;">
                <div class="progress-bar bg-violette" role="progressbar" aria-label="Felice" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                  <div class="d-flex justify-content-start align-items-center">
                    <img src="img/Smile.svg" alt="Sad" height="60px" class="px-2">
                    <p class="color-dark-custom w-100 text-center fs-4 m-0" id="LblProgessSorriso">0%</p>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="scripts/bootstrap.js" rel="script"></script>
</body>
</html>
