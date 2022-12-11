<html>
<head>
  <title>Paziente</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
  <link rel="stylesheet" href="styles/bootstrap.css">
</head>
<body>
  <div class="p-0 m-0 h-100">
    <div class="row p-0 m-0 h-100">
      <div class="col-md-1 m-0 p-0 border-1 border-end">
        <div class="row">
          <div class="col-12 d-flex justify-content-center align-items-center pt-5 pb-4"><img src="img/WakeApp.png" height="50px" alt="Logo WakeApp"></div>
          <div class="col-12 d-flex justify-content-center align-items-center">
            <button type="button" class="btn btn-primary border-0 bg-yellow-dark color-brown"><i class="bi bi-people-fill me-2"></i>Lista pazienti</button>
          </div>
        </div>
      </div>
      <div class="col-md-11 m-0 p-0">
        <div class="container-fluid p-5">
          <div class="row mb-4 d-flex align-items-center">
            <div class="col-1"><a class="color-brown text-decoration-none fs-5"><i class="bi bi-arrow-left"></i></a></div>
            <div class="col"><h1 class="color-brown"><b>Nome Cognome</b></h1></div>
          </div>

          <!-- Scheda paziente -->
          <div class="row p-4 rounded-5 mb-4 bg-yellow-light">
            <div class="col-md-2 p-4">
              <img src="img/user.svg" height="100%" width="100%">
            </div>
            <div class="col-md-10">
              <form class="row">
                <div class="col-md-6 mb-2">
                  <label for="TxtNomePaziente" class="form-label">Nome</label>
                  <input type="text" class="form-control" id="TxtNomePaziente">
                </div>
                <div class="col-md-6 mb-2">
                  <label for="TxtCognomePaziente" class="form-label">Cognome</label>
                  <input type="text" class="form-control" id="TxtCognomePaziente">
                </div>
                <div class="col-md-6 mb-2">
                  <label for="TxtIndirizzoPaziente" class="form-label">Indirizzo</label>
                  <input type="text" class="form-control" id="TxtIndirizzoPaziente">
                </div>
                <div class="col-md-6 mb-2">
                  <label for="TxtDataNascitaPaziente" class="form-label">Data di nascita</label>
                  <input type="date" class="form-control" id="TxtDataNascitaPaziente">
                </div>
                <div class="col-md-6 mb-2">
                  <label for="TxtEmailPaziente" class="form-label">Email</label>
                  <input type="email" class="form-control" id="TxtEmailPaziente">
                </div>
                <div class="col-md-6 mb-2">
                  <label for="TxtTelefonoPaziente" class="form-label">Telefono</label>
                  <input type="text" class="form-control" id="TxtTelefonoPaziente">
                </div>
                <div class="col-md-12 mt-2 text-end">
                  <button type="button" class="btn btn-primary border-0 bg-yellow-dark color-brown" title="modifica">Modifica<i class="bi bi-pencil-square ms-2"></i></button>
                  <button type="button" class="btn btn-primary border-0 bg-yellow-dark color-brown" title="modifica">Salva<i class="bi bi-save ms-2"></i></button>
                </div>
              </form>
            </div>
          </div>

          <!-- Tabella report -->
          <div class="row">
            <div class="col-12 mb-4">
              <button type="button" class="btn btn-primary border-0 bg-yellow-light color-brown" id="BtnReportVideo">Report video</button>
              <button type="button" class="btn btn-outline-primary border-1 border-yellow-light color-brown" id="BtnReportAudio">Report audio</button>
              <button type="button" class="btn btn-outline-primary border-1 border-yellow-light color-brown" id="BtnDaschboard">Dashboard</button>
            </div>
            <div class="col-12" id="PnlTabellaVideo">
              <table class="table table-sm table-striped border-1 border-yellow-light" id="TblVideo">
                <thead>
                <tr>
                  <th scope="col" class="color-brown text-center">Media</th>
                  <th scope="col" class="color-brown text-center">Data</th>
                  <th scope="col" class="color-brown text-center">Ora</th>
                  <th scope="col" class="color-brown text-center">Emoji</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td class="color-brown align-middle text-center p-2" style="width: 200px;">
                    <div class="ratio ratio-16x9 bg-brown">
                      <div>16x9</div>
                    </div>
                  </th>
                  <td class="color-brown align-middle text-center">00/00/000</td>
                  <td class="color-brown align-middle text-center">00:00</td>
                  <td class="color-brown align-middle text-center">:)</td>
                </tr>
                </tbody>
              </table>
            </div>
            <div class="col-12" id="PnlTabellaAudio">
              <table class="table table-sm table-striped border-1 border-yellow-light" id="TblAudio">
                <thead>
                <tr>
                  <th scope="col" class="color-brown text-center">Media</th>
                  <th scope="col" class="color-brown text-center">Data</th>
                  <th scope="col" class="color-brown text-center">Ora</th>
                  <th scope="col" class="color-brown text-center">Emoji</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td class="color-brown align-middle text-center p-2" style="width: 200px;">
                    <div class="ratio ratio-16x9 bg-brown">
                      <div>16x9</div>
                    </div>
                  </th>
                  <td class="color-brown align-middle text-center">00/00/000</td>
                  <td class="color-brown align-middle text-center">00:00</td>
                  <td class="color-brown align-middle text-center">:)</td>
                </tr>
                </tbody>
              </table>
            </div>
            <div class="col-12" id="PnlDaschboard">
              <div class="row">
                <div class="col-md-6"><h4 class="color-brown">Parametri fisici</h4></div>
                <div class="col-md-6 text-end fs-4"><p class="color-brown" id="LblDataRilevamentoPF">7-12 nov 2022<i class="bi bi-calendar-week ms-2"></i></p></div>
                <div class="col-md-4">
                  <p class="color-brown m-0"><i class="bi bi-heart-pulse me-2"></i>Battito cardiaco</p>
                  <b><p class="color-brown fs-4" id="LblBattitoCardiaco">45-161 bpm</p></b>
                </div>
                <div class="col-md-4">
                  <p class="color-brown m-0"><i class="bi bi-lungs me-2"></i>Frequenza respiratoria</p>
                  <b><p class="color-brown fs-4" id="LblFrequenzaRespiratoria">16,5-27 respiri/min</p></b>
                </div>
                <div class="col-md-4">
                  <p class="color-brown m-0"><i class="bi bi-clock-history me-2"></i>Media ore sonno</p>
                  <b><p class="color-brown fs-4" id="LblMediaOreSonno">7h39min</p></b>
                </div>

                <div class="col-12">Grafico 1</div>
                <div class="col-12">Grafico 2</div>
                <div class="col-12">Grafico 3</div>
              </div>

              <div class="row">
                <div class="col-md-6"><h4 class="color-brown">Parametri ambientali</h4></div>
                <div class="col-md-6 text-end fs-4"><p class="color-brown" id="LblDataRilevamentoPA">7-12 nov 2022<i class="bi bi-calendar-week ms-2"></i></p></div>
                <div class="col-md-4">
                  <p class="color-brown m-0"><i class="bi bi-tree me-2"></i>CO2</p>
                  <b><p class="color-brown fs-4" id="LblCo2">400-432 ppm</p></b>
                </div>
                <div class="col-md-4">
                  <p class="color-brown m-0"><i class="bi bi-brightness-high me-2"></i>Luminosità</p>
                  <b><p class="color-brown fs-4" id="LblLuminosita">303-567 lumen</p></b>
                </div>
                <div class="col-md-4">
                  <p class="color-brown m-0"><i class="bi bi-thermometer-half me-2"></i>Temperatura</p>
                  <b><p class="color-brown fs-4" id="LblTemperatura">22°C</p></b>
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
