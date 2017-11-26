package Filters;

import ecommerce.temporary.UserTempInfoUtility;
import ecommerce.utility.ValidationUtility;
import java.io.*;
import java.util.List;
import java.util.Map;
import javax.servlet.*;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;


public class LoginFilter implements Filter {
  
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
           
            errorMap = validate.validateLoginForm(req);
            if (!errorMap.isEmpty()){
                session.setAttribute("loginErrorMessage", errorMap);
                session.setAttribute("loginTempInfo", req.getParameter("email"));
                session.setMaxInactiveInterval(60);
                res.sendRedirect("log_in.jsp");
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