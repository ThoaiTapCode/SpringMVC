package com.nhom2.multilang.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

public class WebApplication implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
		ctx.register(WebConfig.class);
		ctx.setServletContext(servletContext);

		DispatcherServlet dispatcherServlet = new DispatcherServlet(ctx);
		ServletRegistration.Dynamic registration = servletContext.addServlet("dispatcher", dispatcherServlet);
		registration.setLoadOnStartup(1);
		registration.addMapping("/");
	}

}
