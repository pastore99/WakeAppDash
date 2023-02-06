<%--
  Created by IntelliJ IDEA.
  User: nicol
  Date: 28/01/2023
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Testing page</title>
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
          <a class="btn-menu btn-menu-active w-100"><i class="bi bi-people-fill me-2"></i>Lista pazienti</a>
          <a class="btn-menu w-100"><i class="bi bi-smartwatch me-2"></i>Dispositivi</a>
          <a class="btn-menu w-100"><i class="bi bi-gear me-2"></i>Impostazioni</a>
        </div>
      </div>
    </div>
    <div class="col-md-10 m-0 p-0 bg-img">
      <div class="container-fluid p-5">
        <div class="row mb-4 d-flex align-items-center">
          <div class="col-12"><p class="mb-0 color-dark-custom">Anagrafica</p></div>
          <div class="col-12"><a class="color-dark-custom text-decoration-none fs-5"><i class="bi bi-arrow-left"></i></a><h1 class="color-dark-custom"><b>Nome Cognome</b></h1></div>
        </div>

        <div class="row p-4 rounded-3 mb-4 bg-violette">
          <div class="col-md-2 p-4">
            <img src="img/user.svg" height="100%" width="100%">
          </div>
          <div class="col-md-9">
            <form class="row">
              <div class="col-md-6 mb-2">
                <label for="TxtNomePaziente" class="form-label">Nome</label>
                <input type="text" class="form-control" id="TxtNomePaziente" readonly value="Nome">
              </div>
              <div class="col-md-6 mb-2">
                <label for="TxtCognomePaziente" class="form-label">Cognome</label>
                <input type="text" class="form-control" id="TxtCognomePaziente" readonly value="Cognome">
              </div>
              <div class="col-md-6 mb-2">
                <label for="TxtIndirizzoPaziente" class="form-label">Indirizzo</label>
                <input type="text" class="form-control" id="TxtIndirizzoPaziente" readonly value="Indirizzo">
              </div>
              <div class="col-md-6 mb-2">
                <label for="TxtDataNascitaPaziente" class="form-label">Data di nascita</label>
                <input type="date" class="form-control" id="TxtDataNascitaPaziente" readonly value="01/01/0000">
              </div>
              <div class="col-md-6 mb-2">
                <label for="TxtEmailPaziente" class="form-label">Email</label>
                <input type="email" class="form-control" id="TxtEmailPaziente" readonly value="nome.cognomeemail.it">
              </div>
              <div class="col-md-6 mb-2">
                <label for="TxtTelefonoPaziente" class="form-label">Telefono</label>
                <input type="text" class="form-control" id="TxtTelefonoPaziente" readonly value="333 333 3333">
              </div>
            </form>
          </div>
          <div class="col text-end">
            <a class="color-dark-custom text-decoration-none fs-5 rounded-circle bg-light-green px-2 py-1"><i class="bi bi-pencil-square"></i></a>
          </div>
        </div>


        <div class="row mb-4">
          <div class="col-md-12 text-center">
            <h1 class="color-dark-custom"><i class="bi bi-bell me-2"></i><b>Notifiche</b></h1>
            <h6>Ricorda ai tuoi pazienti che è il momento di leggere un testo o registrare un video!</h6>
          </div>
          <div class="col-12 d-flex justify-content-evenly">
            <a class="btn-menu"><i class="bi bi-mic me-2"></i>Leggi un testo</a>
            <a class="btn-menu">Registra un video<i class="bi bi-camera-video ms-2"></i></a>
          </div>
        </div>

        <!-- Filtri per ricerca e ordinamento -->
        <form class="row m-0">
          <div class="col-md-4 p-0">
            <div class="input-group border border-1 rounded-2">
              <span class="input-group-text border-0 rounded-1 bg-white" id="Cerca"><i class="bi bi-search color-brown"></i></span>
              <input type="text" class="form-control border-0 rounded-1 text-end" aria-label="Cerca..." aria-describedby="Cerca" placeholder="Cerca">
            </div>
          </div>
        </form>

        <!-- Tabella lista pazienti -->

        <div class="row">
          <div class="col-md-12 text-end"><p id="LblNumeroPazienti" class="color-dark-custom mb-1"><b>x</b> pazienti</p></div>
          <div class="col-12">
            <table class="table table-sm table-striped border border-1">
              <thead>
              <tr>
                <th scope="col" class="text-center">NOME</th>
                <th scope="col" class="text-center">COGNOME</th
                <th scope="col" class="text-center">CODICE FISCALE</th>
                <th scope="col" class="text-center">DATA DI NASCITA</th>
                <th scope="col" class="text-center">EMAIL</th>
                <th scope="col" class="text-center"></th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td class="color-brown align-middle text-center">Nicola</th>
                <td class="color-brown align-middle text-center">Laurino</td>
                <td class="color-brown align-middle text-center">LRNNCL97M29G793W</td>
                <td class="color-brown align-middle text-center">29/08/1997</td>
                <td class="color-brown align-middle text-center">nicola.laurino97@gmail./com</td>
                <td class="text-end"><a href="" class="btn-menu btn-menu-active px-2 py-1">Apri<i class="bi bi-arrow-bar-right ms-2"></i></a></td>
              </tr>
              <tr>
                <td class="color-brown align-middle text-center">Nicola</th>
                <td class="color-brown align-middle text-center">Laurino</td>
                <td class="color-brown align-middle text-center">LRNNCL97M29G793W</td>
                <td class="color-brown align-middle text-center">29/08/1997</td>
                <td class="color-brown align-middle text-center">nicola.laurino97@gmail./com</td>
                <td class="text-end"><a href="" class="btn-menu btn-menu-active px-2 py-1">Apri<i class="bi bi-arrow-bar-right ms-2"></i></a></td>
              </tr>
              <tr>
                <td class="color-brown align-middle text-center">Nicola</th>
                <td class="color-brown align-middle text-center">Laurino</td>
                <td class="color-brown align-middle text-center">LRNNCL97M29G793W</td>
                <td class="color-brown align-middle text-center">29/08/1997</td>
                <td class="color-brown align-middle text-center">nicola.laurino97@gmail./com</td>
                <td class="text-end"><a href="" class="btn-menu btn-menu-active px-2 py-1">Apri<i class="bi bi-arrow-bar-right ms-2"></i></a></td>
              </tr>
              <tr>
                <td class="color-brown align-middle text-center">Nicola</th>
                <td class="color-brown align-middle text-center">Laurino</td>
                <td class="color-brown align-middle text-center">LRNNCL97M29G793W</td>
                <td class="color-brown align-middle text-center">29/08/1997</td>
                <td class="color-brown align-middle text-center">nicola.laurino97@gmail./com</td>
                <td class="text-end"><a href="" class="btn-menu btn-menu-active px-2 py-1">Apri<i class="bi bi-arrow-bar-right ms-2"></i></a></td>
              </tr>
              <tr>
                <td class="color-brown align-middle text-center">Nicola</th>
                <td class="color-brown align-middle text-center">Laurino</td>
                <td class="color-brown align-middle text-center">LRNNCL97M29G793W</td>
                <td class="color-brown align-middle text-center">29/08/1997</td>
                <td class="color-brown align-middle text-center">nicola.laurino97@gmail./com</td>
                <td class="text-end"><a href="" class="btn-menu btn-menu-active px-2 py-1">Apri<i class="bi bi-arrow-bar-right ms-2"></i></a></td>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
