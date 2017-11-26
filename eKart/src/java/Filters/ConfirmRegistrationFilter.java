package Filters;

import ecommerce.utility.ValidationUtility;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;


public class ConfirmRegistrationFilter implements Filter {
    
   private FilterConfig filterConfig = null;
    
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        Throwable problem = null;
        ValidationUtility validate = new ValidationUtility();
        try {
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;
            HttpSession session = req.getSession();
            
            String errorString = validate.validateConfirmRegistration(req);
            session.setAttribute("confirmationErrorMessage", errorString);
            if (errorString != null && !errorString.equals("")){
                res.sendRedirect("confirm_registration.jsp");
            }
            else{
                chain.doFilter(request, response);
            }
        } catch (Throwable t) {
            problem = t;
            t.printStackTrace();
        }
    }

   
    public void destroy() {        
    }

    public void init(FilterConfig filterConfig) {        
        this.filterConfig = filterConfig;
    }
}
