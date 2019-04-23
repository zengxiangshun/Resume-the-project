<%@ page import="com.qhit.baseUser.pojo.BaseUser" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/3 0003
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/common.jsp"%>
<html>
<head>
    <title>Title</title>
    <script>
        $(function () {
            $.get("${path}/baseModule/toplist.action",function (data) {
                var $s = $("#mid");
                var a = ${baseFunction.mid}
                $(data).each(function () {
                    if (a==this.mid){
                        var $a = $("<option value='"+this.mid+"'>"+this.mname+"</option>");
                        $a.appendTo($s);
                    }
                })
                $(data).each(function () {
                    if (a!=this.mid){
                        var $a = $("<option value='"+this.mid+"'>"+this.mname+"</option>");
                        $a.appendTo($s);
                    }
                })
            },"json")
        })
    </script>
</head>

<body class="main">
<h1>修改模块</h1>
<form action="${path}/baseFunction/update.action">
    <input type="hidden" name="fid" value="${baseFunction.fid}">
    <div class="update">
        <div class="left">
            <span>功能名</span>
            <input type="text" name="fname" value="${baseFunction.fname}">
        </div>
        <div class="right">
            <span>模块名</span>
            <select id="mid" name="mid" value="${baseFunction.mid}">

            </select>
        </div>
        <div class="left">
            <span>url</span>
            <input type="text" name="url" value="${baseFunction.url}">
        </div>
        <div id="error"></div>
        <div class="buttons">
            <input type="submit" value="提交">
            <input type="button" onclick="history.back()" value="返回">
        </div>
    </div>
</form>
</body>

</html>
