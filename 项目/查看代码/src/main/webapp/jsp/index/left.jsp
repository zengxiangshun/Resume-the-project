<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/29 0029
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/common.jsp"%>
<html>
<head>
    <script type="text/javascript">
        $(function () {
            <%--$("#i1").click(function () {--%>
                <%--window.parent.mainFrame.location.href = "${path}/baseUser/list.action";--%>
            <%--})--%>
            <%--$("#i2").click(function () {--%>
                <%--window.parent.mainFrame.location.href = "${path}/baseModule/list.action";--%>
            <%--})--%>
            <%--$("#i3").click(function () {--%>
                <%--window.parent.mainFrame.location.href = "${path}/baseFunction/list.action";--%>
            <%--})--%>
            $(".left_nav").delegate("li","click",function () {
                $(this).parent().children().attr("class","");
                $(this).attr("class","current");
                $(this).parent().children().css("color","");
                $(this).css("color","red");
                var url = $(this).children().attr("name");
                window.parent.mainFrame.location.href = "${path}"+url+".action";
            })

        })
    </script>
</head>
<body class="left">
<div class="page">
    <div class="margin_div">
        <div class="page_main">
            <ul class="left_nav">
                <%--<li class="current" id="i1">用户管理</li>--%>
                <%--<li id="i2">模块管理</li>--%>
                <%--<li id="i3">功能管理</li>--%>
                <%--<li>部门管理</li>--%>
                <%--<li>岗位管理</li>--%>
                <c:forEach items="${list}" var="function">
                    <li><span name="${function.url}">${function.fname}</span></li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
