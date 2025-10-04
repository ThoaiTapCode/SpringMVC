package com.nhom2.multilang.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.nhom2.multilang.model.ProductTranslation;

@Repository
public class ProductTranslationDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public ProductTranslation getProductTranslationByIdAndLang(int productId, String languageId) {
		String sql = "SELECT * FROM producttranslation WHERE productID = ? AND languageID = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { productId, languageId },
				(rs, rowNum) -> new ProductTranslation(
						rs.getInt("productID"),
						rs.getString("languageID"),
						rs.getString("productName"),
						rs.getString("productDescription")
		));
	}
	
	public void addProductTranslation(ProductTranslation pt) {
		String sql = "INSERT INTO producttranslation (productID, languageID, productName, productDescription) VALUES (?, ?, ?, ?)";
		jdbcTemplate.update(sql, pt.getProductId(), pt.getLanguageID(), pt.getProductName(), pt.getProductDescription());
	}
	
	public void updateProductTranslation(ProductTranslation pt) {
		String sql = "UPDATE producttranslation SET productName = ?, productDescription = ? WHERE productID = ? AND languageID = ?";
		jdbcTemplate.update(sql, pt.getProductName(), pt.getProductDescription(), pt.getProductId(), pt.getLanguageID());
	}
	
	public void deleteProductTranslation(int productId, String languageId) {
		String sql = "DELETE FROM producttranslation WHERE productID = ? AND languageID = ?";
		jdbcTemplate.update(sql, productId, languageId);
	}
}
