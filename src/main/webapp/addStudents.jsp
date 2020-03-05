<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/28 0028
  Time: 下午 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="form1" name="form1" method="post" action="addStudents">

    <p>姓名:
        <input type="text" name="name" id="textfield2"/>
    </p>
    <p>性别:
        <input checked type="radio" name="sex" value="男"/>男
        <input type="radio" name="sex" value="女"/>女
    </p>
    <p>年龄:
        <input type="text" name="age" id="textfield4"/>
    </p>
    <p>生日:
        <input type="date" name="birthday" id="textfield5"/>
    </p>
    <p>地址:
        <input type="text" name="adress" id="textfield6"/>
    </p>
    <p>电话:
        <input type="text" name="tel" id="textfield7"/>
    </p>
    <p>状态:
        <input type="text" name="state" id="textfield8"/>
    </p>
    <p>年级:
        <select name="gid">
            <c:forEach items="${allGrade}" var="a">
                <option value="${a.gid}">${a.gname}</option>
            </c:forEach>
        </select>

    </p>
    <input type="submit" name="button" id="button" value="提交"/>
</form>
</body>
</html>
