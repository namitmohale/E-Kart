package Filters;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import org.apache.commons.validator.GenericValidator;
import ecommerce.utility.ValidationUtility;
import java.util.List;
import java.util.Map;
import ecommerce.temporary.UserTempInfoUtility;

public class RegistrationFilter implements Filter {
    
    private FilterConfig filterConfig = null;
       
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        Throwable problem = null;
        try{
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;
            HttpSession session = (HttpSession) req.getSession();
            
            ValidationUtility validate = new ValidationUtility();
            Map<String, List<String>> errorMap;
            UserTempInfoUtility userTemp = new UserTempInfoUtility();
            userTemp.saveUserTempRegistrationInfo(req);
            errorMap = validate.validateRegistrationForm(req);
            if (!errorMap.isEmpty()){
                session.setAttribute("registrationErrorMessage", errorMap);
                session.setMaxInactiveInterval(60);
                res.sendRedirect("registration.jsp");
            }
            else{
                session.invalidate();
                chain.doFilter(request, response);
            }
        } catch (Throwable t) {
            problem = t;
            t.printStackTrace();
        }
    }

    public void init(FilterConfig filterConfig) {        
        this.filterConfig = filterConfig;
    }

    @Override
    public void destroy() {
        filterConfig = null;
    }
}
