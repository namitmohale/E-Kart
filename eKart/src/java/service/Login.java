package service;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import ecommerce.business.User;
import ecommerce.database.UserIO;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session;
        User user = new User();
        String redirect;
        try {
            UserIO userio = new UserIO();
            ServletContext context = getServletContext();

            session = request.getSession();
            user = userio.getUser(request.getParameter("email"));
            redirect = (String) context.getAttribute("referer");

            if (user.getUserID() == 0 || user.getEmail() == null) {

                Map<String, List<String>> errorMap = new HashMap();
                List<String> errorList = new ArrayList();
                errorList.add("Login fail");
                errorMap.put("loginError", errorList);
                session.setAttribute("loginErrorMessage", errorMap);
               
              //  context.removeAttribute("referer");
                response.sendRedirect("log_in.jsp");
                return;
            }
            context.removeAttribute("referer");
            session.setAttribute("user", user);
            session.setAttribute("userid", user.getUserID());

            session.setMaxInactiveInterval(11 * 60);
            if (!redirect.contains("log_in.jsp")
                    && !redirect.contains("registration.jsp")) {
                response.sendRedirect(redirect);
            } else {
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            out.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
