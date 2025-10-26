package com.nhom2.multilang.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.nhom2.multilang.model.Language;
import com.nhom2.multilang.service.LanguageService;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

@ControllerAdvice
public class GlobalControllerAdvice {

	@Autowired
	private LanguageService languageService;

	@ModelAttribute("availableLanguages")
	public List<Language> getAvailableLanguages() {
		return languageService.getAllLanguages();
	}

	@ModelAttribute("currentLang")
	public String getCurrentLanguage(HttpServletRequest request) {
		String lang = request.getParameter("lang");
		return lang != null ? lang : "vi";
	}

	@ModelAttribute("currentUrl")
	public String getCurrentUrl(HttpServletRequest request) {
		return request.getRequestURI();
	}

	@ModelAttribute("queryString")
	public String getQueryString(HttpServletRequest request) {
		String queryString = request.getQueryString();
		return queryString != null ? queryString : "";
	}
}
