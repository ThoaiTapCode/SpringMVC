package com.nhom2.multilang.model;

public class Language {
	private String languageID;
	private String languageName;
	
	public Language() {	}
	
	public Language(String languageID, String languageName) {
		this.languageID = languageID;
		this.languageName = languageName;
	}

	public String getLanguageID() {
		return languageID;
	}

	public void setLanguageID(String languageID) {
		this.languageID = languageID;
	}

	public String getLanguageName() {
		return languageName;
	}

	public void setLanguageName(String languageName) {
		this.languageName = languageName;
	}
}
