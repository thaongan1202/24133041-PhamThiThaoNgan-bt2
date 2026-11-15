<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách danh mục</title>
</head>
<body>
    <h2>Danh sách danh mục</h2>
    <a href="<c:url value='/admin/category/add'/>">Thêm danh mục</a>
    <hr>
    <table border="1" width="100%" cellpadding="8">
        <tr>
            <th>STT</th>
            <th>Hình ảnh</th>
            <th>Tên danh mục</th>
            <th>Trạng thái</th>
            <th>Hành động</th>
        </tr>
        <c:forEach items="${listcate}" var="cate" varStatus="STT">
            <c:choose>
                <c:when test="${fn:startsWith(cate.images, 'https')}">
                    <c:url value="${cate.images}" var="imgUrl" />
                </c:when>
                <c:otherwise>
                    <c:url value="/image?fname=${cate.images}" var="imgUrl" />
                </c:otherwise>
            </c:choose>
            <tr>
                <td>${STT.index + 1}</td>
                <td><img height="150" width="200" src="${imgUrl}" /></td>
                <td>${cate.categoryname}</td>
                <td>
                    <c:if test="${cate.status == 1}">Hoạt động</c:if>
                    <c:if test="${cate.status != 1}">Khóa</c:if>
                </td>
                <td>
                    <a href="<c:url value='/admin/category/edit?id=${cate.categoryid}'/>">Sửa</a> |
                    <a href="<c:url value='/admin/category/delete?id=${cate.categoryid}'/>"
                       onclick="return confirm('Bạn có chắc muốn xóa không?');">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>