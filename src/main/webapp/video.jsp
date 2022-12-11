<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

          <!-- Video -->
          <div class="row bg-brown p-2">
            <div class="col-12 d-flex justify-content-center">
              <div class="ratio ratio-16x9 bg-yellow-dark w-50">
                <div>16x9</div>
              </div>
            </div>
            <div class="col-12"><p class="text-white" id="LblDataRegistrazione">Video registrato il 00/00/0000 alle 00:00</p></div>
          </div>

          <!-- Emozioni -->
          <div class="row my-4">
            <div class="col-md-6 text-center">
              <img src="img/Happy.svg" alt="Happy" height="120px">
              <p class="color-brown fs-4">Utente</p>
            </div>
            <div class="col-md-6 text-center">
              <img src="img/Sad.svg" alt="Sad" height="120px">
              <span class="badge rounded-pill bg-yellow-light color-brown">100%</span>
              <p class="color-brown fs-4">Intelligenza artificiale</p>
            </div>
            <div class="col-12"><h4 class="color-brown">Intelligenza artificiale - probabilità emozioni</h4></div>
            <div class="col-12 my-2">
              <div class="progress" style="height: 68px;">
                <div class="progress-bar bg-yellow-dark" role="progressbar" aria-label="Triste" style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
                  <div class="d-flex justify-content-start align-items-center">
                    <img src="img/Sad.svg" alt="Sad" height="60px" class="px-2">
                    <p class="color-brown w-100 text-center fs-4 m-0" id="LblProgessTriste">100%</p>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-12 my-2">
              <div class="progress" style="height: 68px;">
                <div class="progress-bar bg-yellow-dark" role="progressbar" aria-label="Arrabbiato" style="width: 68%;" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
                  <div class="d-flex justify-content-start align-items-center">
                    <img src="img/Angry.svg" alt="Sad" height="60px" class="px-2">
                    <p class="color-brown w-100 text-center fs-4 m-0" id="LblProgessArrabbiato">68%</p>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-12 my-2">
              <div class="progress" style="height: 68px;">
                <div class="progress-bar bg-yellow-dark" role="progressbar" aria-label="Felice" style="width: 22%;" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100">
                  <div class="d-flex justify-content-start align-items-center">
                    <img src="img/Happy.svg" alt="Sad" height="60px" class="px-2">
                    <p class="color-brown w-100 text-center fs-4 m-0" id="LblProgessFelice">22%</p>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-12 my-2">
              <div class="progress" style="height: 68px;">
                <div class="progress-bar bg-yellow-dark" role="progressbar" aria-label="Felice" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                  <div class="d-flex justify-content-start align-items-center">
                    <img src="img/Smile.svg" alt="Sad" height="60px" class="px-2">
                    <p class="color-brown w-100 text-center fs-4 m-0" id="LblProgessSorriso">0%</p>
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
