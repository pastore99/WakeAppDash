<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="controls.ServerPY" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="beans.*" %>
<%@ page import="java.util.*" %>
<%
  Utente user = (Utente) request.getAttribute("utente");
  if(user == null) {
    response.sendRedirect("utente-control");
  } else {
%>
<html>
<head>
  <title>Paziente</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
  <link rel="stylesheet" href="styles/bootstrap.css">
  <script src="https://code.jquery.com/jquery-3.6.3.slim.js" integrity="sha256-DKU1CmJ8kBuEwumaLuh9Tl/6ZB6jzGOBV/5YpNE2BWc=" crossorigin="anonymous"></script>
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
            <div class="col-12"><h6 class="mb-0 color-dark-custom ms-5">Anagrafica</h6></div>
            <div class="col-12 d-flex align-items-center">
              <a class="color-dark-custom text-decoration-none fs-5 d-inline me-2" href="<%=response.encodeURL("dashboard.jsp")%>"><i class="bi bi-arrow-left"></i></a>
              <h1 class="color-dark-custom d-inline"><b><%=user.getNome() + " " + user.getCognome()%></b></h1>
            </div>
          </div>

          <!-- Scheda paziente -->
          <div class="row p-4 rounded-5 mb-4 bg-violette">
            <div class="col-md-2 p-4">
              <img src="img/user.svg" height="100%" width="100%">
            </div>
            <div class="col-md-9">
              <form class="row">
                <div class="col-md-6 mb-2">
                  <label for="TxtNomePaziente" class="form-label">Nome</label>
                  <input type="text" class="form-control" id="TxtNomePaziente" readonly value="<%=user.getNome()%>">
                </div>
                <div class="col-md-6 mb-2">
                  <label for="TxtCognomePaziente" class="form-label">Cognome</label>
                  <input type="text" class="form-control" id="TxtCognomePaziente" readonly value="<%=user.getCognome()%>">
                </div>
                <div class="col-md-6 mb-2">
                  <label for="TxtIndirizzoPaziente" class="form-label">Indirizzo</label>
                  <input type="text" class="form-control" id="TxtIndirizzoPaziente" readonly value="<%=user.getResidenza()%>">
                </div>
                <div class="col-md-6 mb-2">
                  <label for="TxtDataNascitaPaziente" class="form-label">Data di nascita</label>
                  <input type="date" class="form-control" id="TxtDataNascitaPaziente" readonly value="<%=user.getDataDiNascita()%>">
                </div>
                <div class="col-md-6 mb-2">
                  <label for="TxtEmailPaziente" class="form-label">Email</label>
                  <input type="email" class="form-control" id="TxtEmailPaziente" readonly value="<%=user.getEmail()%>">
                </div>
                <div class="col-md-6 mb-2">
                  <label for="TxtTelefonoPaziente" class="form-label">Telefono</label>
                  <input type="text" class="form-control" id="TxtTelefonoPaziente" readonly value="<%=user.getTelefono()%>">
                </div>
              </form>
            </div>
            <div class="col text-end">
              <a class="color-dark-custom text-decoration-none fs-5 rounded-circle bg-light-green px-2 py-1"><i class="bi bi-pencil-square"></i></a>
            </div>
          </div>

          <!-- Tabella report -->
          <div class="row">
            <div class="col-12 mb-4">
              <button type="button" class="btn-menu btn-menu-active" id="BtnReportVideo" onclick="showVideo();">Report video</button>
              <button type="button" class="btn-menu" id="BtnReportAudio" onclick="showAudio();">Report audio</button>
              <button type="button" class="btn-menu" id="BtnDaschboard" onclick="showParametri();">Dashboard</button>
            </div>
            <%
              Collection<?> videos = (Collection<?>) request.getAttribute("video");
              if(videos == null) response.sendRedirect("utente-control");
              if(videos != null && videos.size() > 0) {
            %>
            <div class="col-12" id="PnlTabellaVideo">
              <table class="table table-sm table-striped border border-1" id="TblVideo">
                <thead>
                <tr>
                  <th scope="col" class="text-center">Media</th>
                  <th scope="col" class="text-center">Data</th>
                  <th scope="col" class="text-center">Durata</th>
                  <th scope="col" class="text-center">Emozione utente</th>
                  <th scope="col" class="text-center">Emozione IA</th>
                </tr>
                </thead>
                <tbody>
                <%
                  Iterator<?> iterator = videos.iterator();
                  while (iterator.hasNext()) {
                    Video video = (Video) iterator.next();
                %>
                <tr>
                  <td class="color-dark-custom align-middle text-center p-2" style="width: 200px;">
                    <form action="<%=response.encodeURL("video2-control")%>" method="post">
                      <button class="ratio ratio-16x9 bg-dark-custom" type="submit">
                        <div class="d-flex align-items-center justify-content-center"><i class="bi bi-play-circle text-white fs-2"></i></div>
                      </button>
                      <input type="text" name="InputUser" value="<%=Base64.getUrlEncoder().encodeToString((new Gson().toJson(user)).getBytes())%>" hidden="hidden">
                      <input type="text" name="InputVideo" value="<%=Base64.getUrlEncoder().encodeToString((new Gson().toJson(video)).getBytes())%>" hidden="hidden">
                    </form>
                  </th>
                  <td class="color-dark-custom align-middle text-center"><%=video.getData()%></td>
                  <td class="color-dark-custom align-middle text-center"><%=video.getDurata()%></td>
                  <td class="color-dark-custom align-middle text-center"><%=video.getEmozioneUtente()%></td>
                  <%
                    JSONParser parser = new JSONParser();
                    String app = video.getEmozioneIa().replace("\'", "\"");
                    Object obj2 = parser.parse(app);
                    Emozioni emozioni = ServerPY.parseEmozioniObject((JSONObject) obj2);
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
                  %>
                  <td class="color-dark-custom align-middle text-center"><%=lista.get(0).getNome()%> - <%=lista.get(0).getValore()%>%</td>
                </tr>
                <%
                    }
                %>
                </tbody>
              </table>
            </div>
            <%
              } else {
            %>
            <div class="col-md-12" id="PnlNoVideo">
              <div class="row h-75 d-flex align-content-center">
                <div class="col-md-12 text-center">
                  <img src="illustrations/empty.svg" class="img-fluid my-5" alt="Nessun video presente." style="height: 240px">
                  <h5>Non ci sono video.</h5>
                  <p>L'utente non ha caricato alcun video.<br />Sii paziente, arriveranno presto!</p>
                </div>
              </div>
            </div>
            <%
              }
              Collection<?> audio = (Collection<?>) request.getAttribute("audio");
              if(audio == null) response.sendRedirect("utente-control");
              if(audio != null && audio.size() > 0) {
            %>
            <div class="col-12 d-none" id="PnlTabellaAudio">
              <table class="table table-sm table-striped border border-1" id="TblAudio">
                <thead>
                <tr>
                  <th scope="col" class="text-center">Media</th>
                  <th scope="col" class="text-center">Data</th>
                  <th scope="col" class="text-center">Durata</th>
                  <th scope="col" class="text-center">Emozione utente</th>
                  <th scope="col" class="text-center">Emozione IA</th>
                </tr>
                </thead>
                <tbody>
                <%
                  Iterator<?> iterator = audio.iterator();
                  while (iterator.hasNext()) {
                    Audio audio1 = (Audio) iterator.next();
                %>
                <tr>
                  <% String urlsafe = Base64.getUrlEncoder().encodeToString(user.getKey().getBytes(StandardCharsets.UTF_8)); %>
                  <td class="text-center">
                    <form action="<%=response.encodeURL("audio-control")%>" method="post">
                      <button class="ratio ratio-16x9 bg-dark-custom" type="submit">
                        <div class="d-flex align-items-center justify-content-center"><i class="bi bi-cassette text-white fs-2"></i></div>
                      </button>
                      <input type="text" name="InputUser" value="<%=Base64.getUrlEncoder().encodeToString((new Gson().toJson(user)).getBytes(StandardCharsets.UTF_8))%>" hidden="hidden">
                      <%
                        String json = new Gson().toJson(audio1);
                      %>
                      <input type="text" name="InputAudio" value="<%=Base64.getUrlEncoder().encodeToString(json.getBytes(StandardCharsets.UTF_8))%>" hidden="hidden">
                    </form>
                  </td>
                  <td class="color-dark-custom align-middle text-center"><%=audio1.getData()%></td>
                  <td class="color-dark-custom align-middle text-center"><%=audio1.getDurata()%></td>
                  <td class="color-dark-custom align-middle text-center"><%=audio1.getEmozioneutente()%></td>
                  <%
                    JSONParser parser = new JSONParser();
                    String app = audio1.getEmozioneia().replace("\'", "\"");
                    Object obj2 = parser.parse(app);
                    Emozioni emozioni = ServerPY.parseEmozioniObject((JSONObject) obj2);
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
                  %>
                  <td class="color-dark-custom align-middle text-center"><%=lista.get(0).getNome()%> - <%=lista.get(0).getValore()%>%</td>
                </tr>
                <%
                  }
                %>
                </tbody>
              </table>
            </div>
            <%
              } else {
            %>
            <div class="col-md-12 d-none" id="PnlNoAudio">
              <div class="row h-75 d-flex align-content-center">
                <div class="col-md-12 text-center">
                  <img src="illustrations/empty.svg" class="img-fluid my-5" alt="Nessun audio presente." style="height: 240px">
                  <h5>Non ci sono audio.</h5>
                  <p>L'utente non ha caricato alcun audio.<br />Sii paziente, arriveranno presto!</p>
                </div>
              </div>
            </div>
            <%
              }
            %>
            <div class="col-12 d-none" id="PnlDaschboard">
              <div class="row">
                <div class="col-md-6"><h4 class="color-dark-custom">Parametri fisici</h4></div>
                <div class="col-md-6 text-end fs-4"><p class="color-dark-custom" id="LblDataRilevamentoPF">7-12 nov 2022<i class="bi bi-calendar-week ms-2"></i></p></div>
                <div class="col-md-4">
                  <p class="color-dark-custom m-0"><i class="bi bi-heart-pulse me-2"></i>Battito cardiaco</p>
                  <b><p class="color-dark-custom fs-4" id="LblBattitoCardiaco">45-161 bpm</p></b>
                </div>
                <div class="col-md-4">
                  <p class="color-dark-custom m-0"><i class="bi bi-lungs me-2"></i>Frequenza respiratoria</p>
                  <b><p class="color-dark-custom fs-4" id="LblFrequenzaRespiratoria">16,5-27 respiri/min</p></b>
                </div>
                <div class="col-md-4">
                  <p class="color-dark-custom m-0"><i class="bi bi-clock-history me-2"></i>Media ore sonno</p>
                  <b><p class="color-dark-custom fs-4" id="LblMediaOreSonno">7h39min</p></b>
                </div>

                <div class="col-12">Grafico 1</div>
                <div class="col-12">Grafico 2</div>
                <div class="col-12">Grafico 3</div>
              </div>

              <div class="row">
                <div class="col-md-6"><h4 class="color-dark-custom">Parametri ambientali</h4></div>
                <div class="col-md-6 text-end fs-4"><p class="color-dark-custom" id="LblDataRilevamentoPA">7-12 nov 2022<i class="bi bi-calendar-week ms-2"></i></p></div>
                <div class="col-md-4">
                  <p class="color-dark-custom m-0"><i class="bi bi-tree me-2"></i>CO2</p>
                  <b><p class="color-dark-custom fs-4" id="LblCo2">400-432 ppm</p></b>
                </div>
                <div class="col-md-4">
                  <p class="color-dark-custom m-0"><i class="bi bi-brightness-high me-2"></i>Luminosità</p>
                  <b><p class="color-dark-custom fs-4" id="LblLuminosita">303-567 lumen</p></b>
                </div>
                <div class="col-md-4">
                  <p class="color-dark-custom m-0"><i class="bi bi-thermometer-half me-2"></i>Temperatura</p>
                  <b><p class="color-dark-custom fs-4" id="LblTemperatura">22°C</p></b>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="scripts/bootstrap.js" rel="script"></script>
  <script src="scripts/script.js" rel="script"></script>
</body>
</html>
<% } %>
