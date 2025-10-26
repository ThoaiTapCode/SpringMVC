-- Schema for H2 Database
CREATE TABLE IF NOT EXISTS language (
  languageId VARCHAR(2) NOT NULL,
  language VARCHAR(50) DEFAULT NULL,
  isDeleted BIT(1) DEFAULT 0,
  PRIMARY KEY (languageId)
);

CREATE TABLE IF NOT EXISTS productcategory (
  productCategoryID INT NOT NULL AUTO_INCREMENT,
  canBeShipped BIT(1) DEFAULT 1,
  isDeleted BIT(1) DEFAULT 0,
  PRIMARY KEY (productCategoryID)
);

CREATE TABLE IF NOT EXISTS product (
  productID INT NOT NULL AUTO_INCREMENT,
  price FLOAT DEFAULT NULL,
  weight DECIMAL(4,2) DEFAULT NULL,
  productCategoryID INT DEFAULT NULL,
  isDeleted BIT(1) DEFAULT 0,
  PRIMARY KEY (productID),
  FOREIGN KEY (productCategoryID) REFERENCES productcategory(productCategoryID)
);

CREATE TABLE IF NOT EXISTS productcategorytranslation (
  productCategoryID INT NOT NULL,
  languageID VARCHAR(2) NOT NULL,
  categoryName VARCHAR(50) DEFAULT NULL,
  isDeleted BIT(1) DEFAULT 0,
  PRIMARY KEY (productCategoryID, languageID),
  FOREIGN KEY (languageID) REFERENCES language(languageId),
  FOREIGN KEY (productCategoryID) REFERENCES productcategory(productCategoryID)
);

CREATE TABLE IF NOT EXISTS producttranslation (
  productID INT NOT NULL,
  languageID CHAR(2) NOT NULL,
  productName VARCHAR(50) DEFAULT NULL,
  productDescription VARCHAR(200) DEFAULT NULL,
  isDeleted BIT(1) DEFAULT 0,
  PRIMARY KEY (productID, languageID),
  FOREIGN KEY (languageID) REFERENCES language(languageId),
  FOREIGN KEY (productID) REFERENCES product(productID)
);
