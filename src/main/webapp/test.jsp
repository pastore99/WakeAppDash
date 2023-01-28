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
        <div class="row mb-4"><h1 class="color-dark-custom"><b>Lista pazienti</b></h1></div>

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
                <th scope="col" class="text-center">COGNOME</th>
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
