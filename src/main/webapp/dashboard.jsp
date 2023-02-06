<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="ISO-8859-1" import="java.util.*, beans.Utente" %>
<html>
<head>
  <title>Dashboard</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
  <link rel="stylesheet" href="styles/bootstrap.css">
  <script>
    function mySearchFunction(){
      var input, filter, table, tr, td,th, i, txtValue, j;
      input = document.getElementById("myInput");
      filter = input.value.toUpperCase();
      table = document.getElementById("tabellaPazienti");
      tr = table.getElementsByTagName("tr");
      th = table.getElementsByTagName("th")


      for (i = 1; i < tr.length; i++) {
        tr[i].style.display = "none";
        for(var j=0; j<th.length; j++){
          td = tr[i].getElementsByTagName("td")[j];
          if (td) {
            if (td.innerHTML.toUpperCase().indexOf(filter.toUpperCase()) > -1){
              tr[i].style.display = "";
              break;
            }
          }
        }
      }
    } //funzione per la ricerca di pazienti all'interno dell'elenco
  </script>
  <script>
    document.addEventListener("DOMContentLoaded", function() {
      let table = document.getElementById("tabellaPazienti");
      let rows = table.rows;
      let pageSize = 10;
      let pagesCount = Math.ceil(rows.length / pageSize);
      let currentPage = 0;

      function displayPage() {
        for (let i = 0; i < rows.length; i++) {
          rows[i].style.display = i >= pageSize * currentPage && i < pageSize * (currentPage + 1) ? "" : "none";
        }
      }

      document.getElementById("next").addEventListener("click", function() {
        if (currentPage < pagesCount - 1) {
          currentPage++;
          displayPage();
        }
      });

      document.getElementById("prev").addEventListener("click", function() {
        if (currentPage > 0) {
          currentPage--;
          displayPage();
        }
      });

      displayPage();
    });
  </script> <!--dividere gli utenti in pagine di 10 elementi, bisogna fare un solo file js-->
  <script>
    document.addEventListener("DOMContentLoaded", function() {
      let table = document.getElementById("tabellaPazienti");
      let rows = table.rows;
      let headers = table.getElementsByTagName("th");

      for (let i = 0; i < headers.length; i++) {
        headers[i].addEventListener("click", function() {
          sortTable(i);
        });
      }

      function sortTable(column) {
        let switching = true;
        let shouldSwitch = false;
        let i;
        while (switching) {
          switching = false;
          for (i = 1; i < (rows.length - 1); i++) {

            let x = rows[i].getElementsByTagName("td")[column];
            let y = rows[i + 1].getElementsByTagName("td")[column];
            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
              shouldSwitch = true;
              break;
            }
          }
          if (shouldSwitch) {
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
          }
        }
      }
    });
  </script>


</head>
<body>
  <div class="p-0 m-0 h-100">
    <div class="row p-0 m-0 h-100">
      <div class="col-md-2 m-0 p-0 bg-dark-custom">
        <div class="row">
          <div class="col-12 d-flex justify-content-center align-items-center pt-5 pb-4"><img src="img/WakeApp.svg" height="120px" alt="Logo WakeApp"></div>
          <div class="col-12">
            <a href="<%=response.encodeURL("dashboard.jsp")%>" class="btn-menu w-100"><i class="bi bi-people-fill me-2"></i>Lista pazienti</a>
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
                <input type="text" class="form-control border-0 rounded-1 text-end" id="myInput" aria-label="Cerca..." aria-describedby="Cerca" placeholder="Cerca" onkeyup="mySearchFunction()">
              </div>
            </div>
          </form>

          <!-- Tabella lista pazienti -->
          <%
            Collection<?> utenti = (Collection<?>) request.getAttribute("utenti");
            if(utenti == null) response.sendRedirect("utenti-control");
            if (utenti != null && utenti.size() > 0) {
          %>
          <div class="row">
            <div class="col-12 text-end"><p id="LblNumeroPazienti" class="color-dark-custom mb-1"><b>x</b> pazienti</p></div>
            <div class="col-12">
              <table id="tabellaPazienti" class="table table-sm table-striped border border-1">
                <thead>
                <tr>
                  <th scope="col" class="text-center">Nome</th>
                  <th scope="col" class="text-center">Cognome</th>
                  <th scope="col" class="text-center">Codice fiscale</th>
                  <th scope="col" class="text-center">Data di nascita</th>
                  <th scope="col" class="text-center">Email</th>
                  <th scope="col" class="text-center"></th>
                </tr>
                </thead>
                <tbody>
                <%
                  Iterator<?> iterator = utenti.iterator();
                  while (iterator.hasNext()) {
                    Utente utente = (Utente) iterator.next();
                %>
                <tr>
                  <td class="color-brown align-middle text-center"><%=utente.getNome()%> </th>
                  <td class="color-brown align-middle text-center"><%=utente.getCognome()%></td>
                  <td class="color-brown align-middle text-center"><%=utente.getCodiceFiscale()%></td>
                  <td class="color-brown align-middle text-center"><%=utente.getDataDiNascita()%></td>
                  <td class="color-brown align-middle text-center"><%=utente.getEmail()%></td>
                  <td class="text-end"><a href="<%=response.encodeURL("utente-control?id=" + utente.getIdUtente())%>" class="color-dark-custom text-decoration-none fs-5 rounded-circle bg-light-green px-2 py-1">Apri<i class="bi bi-arrow-bar-right ms-2"></i></a></td>
                </tr>
                <%
                  }
                %>
                </tbody>
              </table>
            </div>
          </div>
          <button id="prev" class="btn-menu">Precedente</button>
          <button id="next"  class="btn-menu">Successivo</button>
          <%
            } else {
          %>
          <div class="row h-75 d-flex align-content-center">
            <div class="col-md-12 text-center">
              <img src="illustrations/empty.svg" class="img-fluid my-5" alt="Nessun utente presente." style="height: 240px">
              <h5>Non ci sono utenti.</h5>
              <p>Gli utenti che si registrano all'applicazione vengono visualizzati in questa schermata.<br />Sii paziente, arriveranno presto nuovi utenti!</p>
            </div>
          </div>
          <%
            }
          %>
          <div class="row mt-5">
            <div class="col-md-12 text-center">
              <h1 class="color-dark-custom"><i class="bi bi-bell me-2"></i><b>Notifiche</b></h1>
              <h6>Ricorda ai tuoi pazienti che è il momento di leggere un testo o registrare un video!</h6>
            </div>
            <div class="col-12 my-4 d-flex justify-content-evenly">
              <a class="btn-menu" href="<%=response.encodeURL("send-notifications?type=Audio")%>"><i class="bi bi-mic me-2"></i>Leggi un testo</a>
              <a class="btn-menu" href="<%=response.encodeURL("send-notifications?type=Video")%>">Registra un video<i class="bi bi-camera-video ms-2"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <button type="button" class="btn-menu bg-light-green border-0 p-3 rounded-circle fixed-bottom-right fs-4" data-bs-toggle="modal" data-bs-target="#MdlInserisciPaziente">
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
                  <option value="M">Maschio</option>
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

  <%
    Boolean send = (boolean) request.getAttribute("send");
    if(send) {
  
    } else {

    }
  %>
  <div class="toast align-items-center bg-success text-white border-0" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="d-flex">
      <div class="toast-body">
        Ben fatto, le notifiche sono state inviate ai tuoi pazienti!
      </div>
      <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
  </div>

  <div class="toast align-items-center bg-danger text-white border-0" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="d-flex">
      <div class="toast-body">
        Oh no, qualcosa è andato storto... Le notifiche non sono state inviate!
      </div>
      <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
  </div>

  <script src="scripts/bootstrap.js" rel="script"></script>
</body>
</html>
