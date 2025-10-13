package com.nhom2.multilang.dao;

import java.util.List;

import com.nhom2.multilang.model.Language;

public interface LanguageDAO {
	List<Language> getAllLanguages();
	Language getLanguageById(String languageID);
	void addLanguage(Language language);
	void updateLanguage(Language language);
	void deleteLanguage(String languageID);
}
