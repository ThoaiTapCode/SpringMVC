package com.nhom2.multilang.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/*")
public class LanguageFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// Initialization code if needed
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String query = req.getQueryString();

        // Nếu không có tham số lang thì tự thêm ?lang=en
        if (req.getMethod().equalsIgnoreCase("GET") && req.getParameter("lang") == null) {
            String newUrl;
            if (query == null || query.isEmpty()) {
                newUrl = req.getRequestURI() + "?lang=en";
            } else {
                newUrl = req.getRequestURI() + "?" + query + "&lang=en";
            }

            res.sendRedirect(newUrl);
            return;
        }

        chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		// Cleanup code if needed
	}

}
