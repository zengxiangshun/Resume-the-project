<%--
  Created by IntelliJ IDEA.
  User: 16682
  Date: 2018/12/21
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/common.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<select id="slList" onchange="selectShow()">
    <option value="100">A</option>
    <option value="200">B</option>
    <option value="300">C</option>
    <option value="400">D</option>
</select>
<input type="text" id="txtShow" readonly="true" />
<script>
    window.onload=selectShow;
    function selectShow(){
        document.getElementById("txtShow").value=document.getElementById("slList").value;
    }
</script>
</body>
</html>
