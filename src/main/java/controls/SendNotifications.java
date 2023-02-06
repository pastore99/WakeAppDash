package controls;

import org.json.simple.parser.JSONParser;

import javax.json.JsonString;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SendNotifications", value = "/send-notifications")
public class SendNotifications extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = (String) request.getAttribute("type");
        try {
            Boolean result = ServerPY.sendNotifications("/api/notification", type);
            if(result) {
                RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/dashboard.jsp?send=true");
                dispatcher.forward(request, response);
            } else {
                RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/dashboard.jsp?send=false");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doPost(request, response);
    }
}
