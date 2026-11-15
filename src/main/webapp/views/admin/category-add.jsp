<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm danh mục</title>
</head>
<body>
    <h2>Thêm danh mục</h2>
    <form action="<c:url value='/admin/category/insert'/>" method="post" enctype="multipart/form-data">
        <label for="categoryname">Tên danh mục:</label><br>
        <input type="text" id="categoryname" name="categoryname" required><br><br>

        <label for="images">Link ảnh:</label><br>
        <input type="text" id="images" name="images"><br><br>

        <label for="images1">Hoặc tải ảnh lên:</label><br>
        <input type="file" id="images1" name="images1"><br><br>

        <label>Trạng thái:</label><br>
        <input type="radio" id="ston" name="status" value="1" checked>
        <label for="ston">Hoạt động</label><br>
        <input type="radio" id="stoff" name="status" value="0">
        <label for="stoff">Khóa</label>

        <br><br>
        <input type="submit" value="Thêm">
        <a href="<c:url value='/admin/categories'/>">Hủy</a>
    </form>
</body>
</html>