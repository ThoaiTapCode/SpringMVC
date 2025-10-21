package com.nhom2.multilang.dao.mysql;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.nhom2.multilang.dao.ProductTranslationDAO;
import com.nhom2.multilang.model.ProductTranslation;

@Repository
public class MySqlProductTranslationDAO implements ProductTranslationDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public ProductTranslation getProductTranslationByIdAndLang(int productId, String languageId) {
		try {
			String sql = "SELECT * FROM producttranslation "
					+ "WHERE productID = ? AND languageID = ? AND isDeleted = 0";
			return jdbcTemplate.queryForObject(sql, new Object[] { productId, languageId },
					(rs, rowNum) -> new ProductTranslation(
							rs.getInt("productID"),
							rs.getString("languageID"),
							rs.getString("productName"),
							rs.getString("productDescription")
							));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	@Override
	public void addProductTranslation(ProductTranslation pt) {
		String sql = "INSERT INTO producttranslation (productID, languageID, productName, productDescription) VALUES (?, ?, ?, ?)";
		jdbcTemplate.update(sql, pt.getProductId(), pt.getLanguageID(), pt.getProductName(), pt.getProductDescription());
	}
	
	@Override
	public void updateProductTranslation(ProductTranslation pt) {
		String sql = "UPDATE producttranslation SET productName = ?, productDescription = ? WHERE productID = ? AND languageID = ?";
		jdbcTemplate.update(sql, pt.getProductName(), pt.getProductDescription(), pt.getProductId(), pt.getLanguageID());
	}
	
	@Override
	public void deleteProductTranslation(int productId, String languageId) {
		String sql = "UPDATE producttranslation SET isDeleted = 1 WHERE productID = ? AND languageID = ?";
		jdbcTemplate.update(sql, productId, languageId);
	}
	
	@Override
	public List<ProductTranslation> getProductTranslationsById(int productId) {
		String sql = "SELECT * FROM producttranslation WHERE productID = ? AND isDeleted = 0";
		return jdbcTemplate.query(sql, new Object[] { productId },
				(rs, rowNum) -> new ProductTranslation(
						rs.getInt("productID"),
						rs.getString("languageID"),
						rs.getString("productName"),
						rs.getString("productDescription")
						));
	}
}
