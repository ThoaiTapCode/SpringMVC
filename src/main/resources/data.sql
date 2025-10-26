-- Sample Data for H2 Database

-- Insert Languages
INSERT INTO language (languageId, language, isDeleted) VALUES
('vi', 'Tiếng Việt', 0),
('en', 'English', 0),
('zh', 'Chinese', 0),
('fr', 'Français', 0);

-- Insert Product Categories
INSERT INTO productcategory (productCategoryID, canBeShipped, isDeleted) VALUES
(1, 1, 0),
(2, 1, 0);

-- Insert Category Translations
INSERT INTO productcategorytranslation (productCategoryID, languageID, categoryName, isDeleted) VALUES
(1, 'vi', 'Tivi', 0),
(1, 'en', 'Television', 0),
(1, 'zh', '电视', 0),
(1, 'fr', 'Télévision', 0),
(2, 'vi', 'Laptop', 0),
(2, 'en', 'Laptop', 0),
(2, 'zh', '笔记本电脑', 0),
(2, 'fr', 'Ordinateur portable', 0);

-- Insert Products
INSERT INTO product (productID, price, weight, productCategoryID, isDeleted) VALUES
(1, 15000000, 12.50, 1, 0),
(2, 25000000, 8.00, 1, 0),
(3, 18000000, 1.50, 2, 0),
(4, 32000000, 1.80, 2, 0),
(5, 45000000, 2.00, 2, 0);

-- Insert Product Translations
INSERT INTO producttranslation (productID, languageID, productName, productDescription, isDeleted) VALUES
(1, 'vi', 'Smart TV Samsung 55 inch', 'TV thông minh Samsung 4K UHD 55 inch với công nghệ QLED', 0),
(1, 'en', 'Samsung 55-inch Smart TV', 'Samsung 4K UHD 55-inch Smart TV with QLED technology', 0),
(1, 'zh', '三星55英寸智能电视', '三星4K UHD 55英寸智能电视，配备QLED技术', 0),
(1, 'fr', 'TV intelligente Samsung 55 pouces', 'TV intelligente Samsung 4K UHD 55 pouces avec technologie QLED', 0),

(2, 'vi', 'Smart TV LG 65 inch', 'TV thông minh LG OLED 65 inch với độ phân giải 4K', 0),
(2, 'en', 'LG 65-inch Smart TV', 'LG OLED 65-inch Smart TV with 4K resolution', 0),
(2, 'zh', 'LG 65英寸智能电视', 'LG OLED 65英寸智能电视，4K分辨率', 0),
(2, 'fr', 'TV intelligente LG 65 pouces', 'TV intelligente LG OLED 65 pouces avec résolution 4K', 0),

(3, 'vi', 'Dell XPS 13', 'Laptop Dell XPS 13 với chip Intel Core i7 thế hệ 12', 0),
(3, 'en', 'Dell XPS 13', 'Dell XPS 13 laptop with 12th Gen Intel Core i7', 0),
(3, 'zh', 'Dell XPS 13', 'Dell XPS 13笔记本电脑，配备第12代Intel Core i7', 0),
(3, 'fr', 'Dell XPS 13', 'Ordinateur portable Dell XPS 13 avec Intel Core i7 12e génération', 0),

(4, 'vi', 'MacBook Pro M3', 'MacBook Pro 14 inch với chip M3 hiệu năng cao', 0),
(4, 'en', 'MacBook Pro M3', 'MacBook Pro 14-inch with high-performance M3 chip', 0),
(4, 'zh', 'MacBook Pro M3', 'MacBook Pro 14英寸，配备高性能M3芯片', 0),
(4, 'fr', 'MacBook Pro M3', 'MacBook Pro 14 pouces avec puce M3 haute performance', 0),

(5, 'vi', 'Lenovo ThinkPad X1 Carbon', 'Laptop Lenovo ThinkPad X1 Carbon Gen 11 dành cho doanh nhân', 0),
(5, 'en', 'Lenovo ThinkPad X1 Carbon', 'Lenovo ThinkPad X1 Carbon Gen 11 for business professionals', 0),
(5, 'zh', 'Lenovo ThinkPad X1 Carbon', 'Lenovo ThinkPad X1 Carbon Gen 11商务专业笔记本电脑', 0),
(5, 'fr', 'Lenovo ThinkPad X1 Carbon', 'Lenovo ThinkPad X1 Carbon Gen 11 pour professionnels', 0);
