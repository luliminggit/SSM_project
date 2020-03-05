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
<form name="form1" id="form1" method="post" action="getLikeStu">
    姓名:<input type="text" name="name" value="${studentByLike.name}"/>
    年龄:<input type="text" name="startAge" value="${studentByLike.startAge}"/>-<input type="text" name="endAge"
                                                                                     value="${studentByLike.endAge}"/>
    <input type="hidden" name="page" id="setPage" value="1">
    <input type="submit" value="搜索"/>
</form>
<a href="getAllGrade">添加</a>
<hr/>
<table border="1">
    <tr>
        <td>学号</td>
        <td>姓名</td>
        <td>年龄</td>
        <td>性别</td>
        <td>地址</td>
        <td>状态</td>
        <td>生日</td>
        <td>电话</td>
        <td>年级</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${likeStu.list}" var="s">
        <tr>
            <td>${s.xh}</td>
            <td>${s.name}</td>
            <td>${s.age}</td>
            <td>${s.sex}</td>
            <td>${s.adress}</td>
            <td>${s.state}</td>
            <td><fmt:formatDate value="${s.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
            <td>${s.tel}</td>
            <td>${s.gname}</td>
            <td><a href="javascript:if(confirm('是否删除')){location.href='deleteStudents?xh=${s.xh}'}">删除</a> <a
                    href="getStudents?xh=${s.xh}">修改</a></td>
        </tr>
    </c:forEach>
</table>

<div>每页${likeStu.pageSize}条、当前是第${likeStu.pageNum}页、共${likeStu.pages}页</div>
<div>
    <a href="javascript:go(1)">首页</a>
    <a href="javascript:go(${likeStu.prePage==0?1:likeStu.prePage})">上一页</a>
    <a href="javascript:go(${likeStu.nextPage==0?likeStu.pages:likeStu.nextPage})">下一页</a>
    <a href="javascript:go(${likeStu.pages})">尾页</a>
</div>

<script language="JavaScript">
    function go(page) {
        //给表单设置页码
        document.getElementById("setPage").value = page;
        //提交表单
        document.getElementById("form1").submit();
    }
</script>
</body>
</html>
