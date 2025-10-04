package com.nhom2.multilang.repository;

import java.util.List;

import com.nhom2.multilang.model.Language;

public interface LanguageRepository {
	public List<Language> getAllLanguages();
	public Language getLanguageById(String languageID);
	public void addLanguage(Language language);
	public void updateLanguage(Language language);
	public void deleteLanguage(String languageID);
}
