<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/29 0029
  Time: 上午 9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="form1" name="form1" method="post" action="updateStudents">
    <p>
        <input type="hidden" name="xh" id="textfield" value="${oneStudents.xh}"/>
    </p>
    <p>姓名:
        <input type="text" name="name" id="textfield2" value="${oneStudents.name}"/>
    </p>
    <p>性别:
        <input ${oneStudents.sex=="男"?"checked":""} type="radio" name="sex" value="男"/>男
        <input ${oneStudents.sex=="女"?"checked":""} type="radio" name="sex" value="女"/>女
    </p>
    <p>年龄:
        <input type="text" name="age" id="textfield4" value="${oneStudents.age}"/>
    </p>
    <p>生日:
        <input type="date" name="birthday" id="textfield5"
               value="<fmt:formatDate value="${oneStudents.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate>"/>
    </p>
    <p>地址:
        <input type="text" name="adress" id="textfield6" value="${oneStudents.adress}"/>
    </p>
    <p>状态:
        <input type="text" name="state" id="textfield7" value="${oneStudents.state}"/>
    </p>
    <p>电话:
        <input type="text" name="tel" id="textfield8" value="${oneStudents.tel}"/>
    </p>
    <p>年级:
        <select name="gid">
            <c:forEach items="${allGrade}" var="a">
                <option ${oneStudents.gid==a.gid?"selected":""} value="${a.gid}">${a.gname}</option>
            </c:forEach>
        </select>
    </p>
    <input type="submit" name="button" id="button" value="更新"/>

</form>
</body>
</html>
