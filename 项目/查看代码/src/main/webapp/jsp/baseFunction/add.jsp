<%--
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
    <style>
        span{
            display: inline-block;
            width: 30%;
        }
        input[type='text'],input[type='datetime']{
            margin-top: 10px;
        }
    </style>
    <script>
        $(function () {
            $.get("${path}/baseModule/toplist.action",function (data) {
                var $s = $("#mid");
                $(data).each(function () {
                    var $a = $("<option value='"+this.mid+"'>"+this.mname+"</option>");
                    $a.appendTo($s);
                })
            },"json")
        })
    </script>
</head>

<body class="main">
    <h1>添加功能</h1>
    <form action="${path}/baseFunction/insert.action">
        <div class="update">
            <div class="left">
                <span>功能名</span>
                <input type="text" name="fname">
            </div>
            <div class="right">
                <span>模块名</span>
                <select id="mid" name="mid">
                    <option></option>
                </select>
            </div>
            <div class="left">
                <span>url</span>
                <input type="text" name="url">
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
