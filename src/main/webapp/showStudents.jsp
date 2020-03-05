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
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="/static/css/bootstrap.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="/static/js/jquery-1.9.1.min.js"></script>
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="/stylesheet" href="/static/css/bootstrap-theme.min.css">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="/static/js/bootstrap.js"></script>
        <script>
            var a = "${param.action}";
            if (a == "add") {
                alert("添加成功")
            }
        </script>

    <script language="JavaScript">
        function go(page) {
            //给表单设置页码
            document.getElementById("setPage").value = page;
            //提交表单
            document.getElementById("form1").submit();
        }
    </script>

</head>
<body>
<form name="form1" id="form1" method="post" action="showStudents" class="form-inline">
    <input type="hidden" name="page" id="setPage" value="1">
    姓名:<input type="text" name="name" value="${stuLik.name}"/>
    年龄:<input type="text" name="startAge" value="${stuLik.startAge}"/>-<input type="text" name="endAge"
                                                                              value="${stuLik.endAge}"/>
    <input type="submit" value="搜索" name="ss" class="btn btn-success"/>
    <input type="reset" value="清空" class="btn btn-danger">
</form>

<button type="button" class="btn btn-info"><a href="getAllGrade">添加</a></button>
<hr/>
<table class="table table-striped .table-bordered  table-hover">
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
    <c:forEach items="${pageInfo.list}" var="s">
        <tr>
            <td>${s.xh}</td>
            <td>${s.name}</td>
            <td>${s.age}</td>
            <td>${s.sex}</td>
            <td>${s.adress}</td>
            <td>${s.state}</td>
            <td><fmt:formatDate value="${s.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
            <td>${s.tel}</td>
            <td>
                <c:forEach items="${allGrade}" var="a">
                    <c:if test="${a.gid==s.gid}">${a.gname}</c:if>
                </c:forEach>
            </td>
            <td><a href="javascript:if(confirm('是否删除')){location.href='deleteStudents?xh=${s.xh}'}">删除</a> <a
                    href="getStudents?xh=${s.xh}">修改</a></td>
        </tr>
    </c:forEach>
</table>

<div>每页${pageInfo.pageSize}条、当前是第${pageInfo.pageNum}页、共${pageInfo.pages}页</div>
<%-- <div>
     <a href="javascript:go(1)">首页</a>
     <a href="javascript:go(${pageInfo.prePage==0?1:pageInfo.prePage})">上一页</a>
     <a href="javascript:go(${pageInfo.nextPage==0?pageInfo.pages:pageInfo.nextPage})">下一页</a>
     <a href="javascript:go(${pageInfo.pages})">尾页</a>
 </div>--%>

<ul class="pagination">
    <li>
        <a href="javascript:go(1)" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
        </a>
    </li>
    <c:forEach begin="1" end="${pageInfo.pages}" var="p">
        <li><a href="javascript:go(${p})">${p}</a></li>
    </c:forEach>

    <li>
        <a href="javascript:go(${pageInfo.pages})" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
        </a>
    </li>
</ul>


</body>
</html>
