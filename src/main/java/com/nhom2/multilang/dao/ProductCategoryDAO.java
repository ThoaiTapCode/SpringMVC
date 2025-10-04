package com.nhom2.multilang.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.nhom2.multilang.model.ProductCategory;

@Repository
public class ProductCategoryDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<ProductCategory> getAllProductCategories() {
		String sql = "SELECT * FROM productcategory";
		return jdbcTemplate.query(sql, (rs, rowNum) -> new ProductCategory(
				rs.getInt("productCategoryID"),
				rs.getBoolean("canBeShipped")
		));
	}
	
	public ProductCategory getProductCategoryById(int id) {
		String sql = "SELECT * FROM productcategory WHERE productCategoryID = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id }, (rs, rowNum) -> new ProductCategory(
				rs.getInt("productCategoryID"),
				rs.getBoolean("canBeShipped")
		));
	}
	
	public int addProductCategory(ProductCategory category) {
		String sql = "INSERT INTO productcategory (canBeShipped) VALUES (?)";
		jdbcTemplate.update(sql, category.isCanBeShipped());
		
		String idSql = "SELECT LAST_INSERT_ID()";
		return jdbcTemplate.queryForObject(idSql, Integer.class);
	}
	
	public void updateProductCategory(ProductCategory category) {
		String sql = "UPDATE productcategory SET canBeShipped = ? WHERE productCategoryID = ?";
		jdbcTemplate.update(sql, category.isCanBeShipped(), category.getProductCategoryId());
	}
	
	public void deleteProductCategory(int id) {
		String sql = "DELETE FROM productcategory WHERE productCategoryID = ?";
		jdbcTemplate.update(sql, id);
	}
}
