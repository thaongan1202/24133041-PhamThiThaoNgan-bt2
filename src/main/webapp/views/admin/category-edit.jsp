<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sửa danh mục</title>
</head>
<body>
    <h2>Sửa danh mục</h2>
    <form action="<c:url value='/admin/category/update'/>" method="post" enctype="multipart/form-data">
        <input type="hidden" name="categoryid" value="${cate.categoryid}">

        <label for="categoryname">Tên danh mục:</label><br>
        <input type="text" id="categoryname" name="categoryname" value="${cate.categoryname}" required><br><br>

        <label for="images">Link ảnh:</label><br>
        <input type="text" id="images" name="images" value="${cate.images}"><br><br>

        <c:choose>
            <c:when test="${fn:startsWith(cate.images, 'https')}">
                <c:url value="${cate.images}" var="imgUrl" />
            </c:when>
            <c:otherwise>
                <c:url value="/image?fname=${cate.images}" var="imgUrl" />
            </c:otherwise>
        </c:choose>
        <img height="150" width="200" src="${imgUrl}" /><br><br>

        <label for="images1">Tải ảnh mới lên:</label><br>
        <input type="file" id="images1" name="images1"><br><br>

        <label>Trạng thái:</label><br>
        <input type="radio" id="ston" name="status" value="1" ${cate.status == 1 ? 'checked' : ''}>
        <label for="ston">Hoạt động</label><br>
        <input type="radio" id="stoff" name="status" value="0" ${cate.status != 1 ? 'checked' : ''}>
        <label for="stoff">Khóa</label>

        <br><br>
        <input type="submit" value="Cập nhật">
        <a href="<c:url value='/admin/categories'/>">Hủy</a>
    </form>
</body>
</html>