<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/27 0027
  Time: 下午 3:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="">添加</a>
<hr/>
<table border="1">
    <tr>
        <td>学号</td>
        <td>年级</td>
        <td>操作</td>

    </tr>
    <c:forEach items="${pageInfo.list}" var="s">
        <tr>
            <td>${s.gid}</td>
            <td>${s.gname}</td>
            <td><a href="javascript:if(confirm('是否删除')){location.href=''}">删除</a> <a href="">修改</a></td>
        </tr>
    </c:forEach>
</table>

<div>每页${pageInfo.pageSize}条、当前是第${pageInfo.pageNum}页、共${pageInfo.pages}页</div>
<div>
    <a href="showGrade?page=1">首页</a>
    <a href="showGrade?page=${pageInfo.prePage==0?1:pageInfo.prePage}">上一页</a>
    <a href="showGrade?page=${pageInfo.nextPage==0?pageInfo.pages:pageInfo.nextPage}">下一页</a>
    <a href="showGrade?page=${pageInfo.pages}">尾页</a>
</div>
</body>
</html>
