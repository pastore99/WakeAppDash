<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Dashboard</title>
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
          <div class="row mb-4"><h1 class="color-brown"><b>Lista pazienti</b></h1></div>

          <!-- Filtri per ricerca e ordinamento -->
          <form class="row mb-4">
            <div class="col-md-4">
              <div class="input-group mb-3">
                <span class="input-group-text border-0 rounded-5 rounded-end bg-yellow-dark" id="Cerca"><i class="bi bi-search color-brown"></i></span>
                <input type="text" class="form-control border-0 rounded-5 rounded-start bg-yellow-dark" aria-label="Cerca..." aria-describedby="Cerca">
              </div>
            </div>
            <div class="col-md-2">
              <div class="input-group mb-3">
                <span class="input-group-text border-0 rounded-5 rounded-end bg-yellow-light" id="Ordina"><i class="bi bi-filter-left color-brown"></i></span>
                <input type="text" class="form-control border-0 rounded-5 rounded-start bg-yellow-light" aria-label="Ordina..." aria-describedby="Ordina">
              </div>
            </div>
            <div class="col-md-2">
              <div class="input-group mb-3">
                <span class="input-group-text border-0 rounded-5 rounded-end bg-yellow-light" id="Filtra"><i class="bi bi-funnel color-brown"></i></span>
                <input type="text" class="form-control border-0 rounded-5 rounded-start bg-yellow-light" aria-label="Filtra..." aria-describedby="Filtra">
              </div>
            </div>
          </form>

          <!-- Tabella lista pazienti -->
          <div class="row">
            <div class="col-12"><p id="LblNumeroPazienti" class="color-brown">Ci sono <b>x</b> pazienti</p></div>
            <div class="col-12">
              <table class="table table-sm table-striped border-1 border-yellow-light">
                <thead>
                <tr>
                  <th scope="col" class="color-brown text-center">Nome</th>
                  <th scope="col" class="color-brown text-center">Cognome</th>
                  <th scope="col" class="color-brown text-center">Codice fiscale</th>
                  <th scope="col" class="color-brown text-center">Sesso</th>
                  <th scope="col" class="color-brown text-center">Data di nascita</th>
                  <th scope="col" class="color-brown text-center"></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td class="color-brown align-middle text-center">Nome</th>
                  <td class="color-brown align-middle text-center">Cognome</td>
                  <td class="color-brown align-middle text-center">CDCFSC00A00G000A</td>
                  <td class="color-brown align-middle text-center">N.D.</td>
                  <td class="color-brown align-middle text-center">00/00/0000</td>
                  <td class="text-end"><button type="button" class="btn btn-primary border-0 bg-yellow-dark color-brown btn-sm">Apri<i class="bi bi-arrow-bar-right ms-2"></i></button></td>
                </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <button type="button" class="btn btn-primary bg-yellow-dark border-0 p-3 rounded-circle fixed-bottom-right fs-4" data-bs-toggle="modal" data-bs-target="#MdlInserisciPaziente">
    <i class="bi bi-plus color-brown"></i>
  </button>

  <!-- Modal -->
  <div class="modal fade" id="MdlInserisciPaziente" tabindex="-1" aria-labelledby="MdlInserisciPaziente" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header bg-yellow-light">
          <h1 class="modal-title fs-5 color-brown" id="exampleModalLabel">Inserisci nuovo paziente</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form>
            <div class="row mb-3">
              <label for="TxtNomePaziente" class="col-sm-4 col-form-label">Nome</label>
              <div class="col-sm-8">
                <input type="text" class="form-control" id="TxtNomePaziente">
              </div>
            </div>
            <div class="row mb-3">
              <label for="TxtCognomePaziente" class="col-sm-4 col-form-label">Cogome</label>
              <div class="col-sm-8">
                <input type="text" class="form-control" id="TxtCognomePaziente">
              </div>
            </div>
            <div class="row mb-3">
              <label for="TxtCodiceFiscalePaziente" class="col-sm-4 col-form-label">Codice fiscale</label>
              <div class="col-sm-8">
                <input type="text" class="form-control" id="TxtCodiceFiscalePaziente">
              </div>
            </div>
            <div class="row mb-3">
              <label for="TxtDataNascitaPaziente" class="col-sm-4 col-form-label">Data di nascita</label>
              <div class="col-sm-8">
                <input type="date" class="form-control" id="TxtDataNascitaPaziente">
              </div>
            </div>
            <div class="row mb-3">
              <label for="SlcSessoPaziente" class="col-sm-4 col-form-label">Sesso</label>
              <div class="col-sm-8">
                <select class="form-select" id="SlcSessoPaziente" aria-label="Sesso del paziente">
                  <option selected>Seleziona il sesso</option>
                  <option value="M">Mascio</option>
                  <option value="F">Femmina</option>
                  <option value="N.D.">Non specificato</option>
                </select>
              </div>
            </div>
            <div class="row">
              <div class="col-12 text-end">
                <button type="button" class="btn btn-primary border-0 bg-brown color-yellow-light me-4" data-bs-dismiss="modal"><i class="bi bi-x-lg me-2"></i>Annulla</button>
                <button type="submit" class="btn btn-primary border-0 bg-yellow-light color-brown">Inserisci<i class="bi bi-person-plus ms-2"></i></button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <script src="scripts/bootstrap.js" rel="script"></script>
</body>
</html>
