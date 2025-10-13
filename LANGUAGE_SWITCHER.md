# Tính năng đổi ngôn ngữ (Language Switcher)

## 📝 Mô tả
Tính năng cho phép người dùng chuyển đổi ngôn ngữ trên thanh header mà vẫn giữ nguyên URL hiện tại, chỉ thay đổi query parameter `lang`.

## ⚙️ Cách hoạt động

### 1. GlobalControllerAdvice
File: `src/main/java/com/nhom2/multilang/config/GlobalControllerAdvice.java`

Tự động inject các biến sau vào tất cả các view:
- `availableLanguages`: Danh sách tất cả ngôn ngữ có sẵn
- `currentLang`: Ngôn ngữ hiện tại (lấy từ query param `lang`, mặc định là "en")
- `currentUrl`: URL hiện tại
- `queryString`: Query string hiện tại

### 2. Header.jsp
File: `src/main/webapp/WEB-INF/views/layout/header.jsp`

Hiển thị dropdown chọn ngôn ngữ với các tính năng:
- Icon globe từ Bootstrap Icons
- Hiển thị tên ngôn ngữ hiện tại
- Dropdown menu liệt kê tất cả ngôn ngữ
- Highlight ngôn ngữ đang được chọn
- JavaScript để thay đổi query parameter `lang`

### 3. JavaScript Function
```javascript
function changeLanguage(newLang) {
    var currentUrl = window.location.href;
    var url = new URL(currentUrl);
    url.searchParams.set('lang', newLang);
    window.location.href = url.toString();
}
```

## 🎯 Cách sử dụng

### Trong Controller
Không cần thêm code gì! `@ControllerAdvice` tự động inject biến `currentLang` vào tất cả view.

### Trong JSP
Sử dụng biến `${currentLang}` để lấy ngôn ngữ hiện tại:

```jsp
<a href="${pageContext.request.contextPath}/products?lang=${currentLang}">Products</a>
```

### Ví dụ URL
- `/products?lang=en` → Ngôn ngữ tiếng Anh
- `/products?lang=vi` → Ngôn ngữ tiếng Việt
- `/categories/meanings/list?id=1&lang=en` → Giữ nguyên id, chỉ đổi lang
- `/categories/meanings/list?id=1&lang=vi` → Chuyển sang tiếng Việt

## 🚀 Demo
1. Truy cập bất kỳ trang nào trong ứng dụng
2. Click vào dropdown ngôn ngữ trên thanh header (góc phải)
3. Chọn ngôn ngữ mong muốn
4. Trang sẽ reload với query parameter `lang` được cập nhật
5. URL và các query parameters khác vẫn được giữ nguyên

## 🎨 Style
- Dropdown được style với Bootstrap 5
- Icon globe từ Bootstrap Icons
- Ngôn ngữ hiện tại được highlight với màu xanh
- Responsive trên mobile

## 📌 Lưu ý
- Mặc định ngôn ngữ là "en" nếu không có query param `lang`
- Tất cả các controller đã tự động có access đến `currentLang`
- Không cần thêm code vào từng controller riêng lẻ
