package com.nhom2.multilang.service;

import java.util.List;

import com.nhom2.multilang.model.Language;

public interface LanguageService {
	public List<Language> getAllLanguages();
	public Language getLanguageById(String languageId);
	public void addLanguage(Language language);
	public void updateLanguage(Language language);
	public void deleteLanguage(String languageId);
}
