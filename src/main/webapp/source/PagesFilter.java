package main.webapp.source;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/user/*")
public class PagesFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws  ServletException{
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();

        if ((boolean) session.getAttribute("isAuthorized")){//проверка авторизирован ли пользователь
            filterChain.doFilter(servletRequest, servletResponse);//если да, то выполняем дальнейишие действия
        }
        else
        {
            //если нет, отправляем на страницу входа
            response.sendRedirect("../login.jsp");
        }
    }
    @Override
    public void destroy( ) {

    }
}
