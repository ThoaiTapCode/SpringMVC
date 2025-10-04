package com.nhom2.multilang.repository.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nhom2.multilang.dao.LanguageDAO;
import com.nhom2.multilang.model.Language;
import com.nhom2.multilang.repository.LanguageRepository;

@Repository
public class LanguageRepositoryImpl implements LanguageRepository {
	
	@Autowired
	private LanguageDAO languageDAO;

	@Override
	public List<Language> getAllLanguages() {
		return languageDAO.getAllLanguages();
	}

	@Override
	public Language getLanguageById(String languageID) {
		return languageDAO.getLanguageById(languageID);
	}

	@Override
	public void addLanguage(Language language) {
		languageDAO.addLanguage(language);
	}

	@Override
	public void updateLanguage(Language language) {
		languageDAO.updateLanguage(language);
	}

	@Override
	public void deleteLanguage(String languageID) {
		languageDAO.deleteLanguage(languageID);
	}

}
