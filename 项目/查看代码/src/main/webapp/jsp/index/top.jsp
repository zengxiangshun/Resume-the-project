
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
            $("#log").click(function () {
                window.parent.location.href="${path}/baseUser/logout.action"
            })
            $("#changePassword").click(function () {
                window.open('${path}/jsp/login/changePassword.jsp', '修改密码', 'height=400, width=800, top=200, left=400');
            })
            $.get("${path}/baseModule/toplist.action",function (data) {
                var $s = $(".nav");
                var count = 1;
                $(data).each(function () {
                    if (count==1){
                        window.parent.leftFrame.location.href = "${path}/baseFunction/midlist.action?mid="+this.mid;
                        count++;
                    }
                    var $a = $('<a href="#"  target="_self" name="'+this.mid+'"><SPAN class=STYLE2>'+this.mname+'</SPAN></a>');
                    $a.appendTo($s);
                })
            },"json");
            $(".nav").delegate("a","click",function () {
                var mid = $(this).attr("name");
                $(this).parent().children().children().css("color","");
                $(this).children().css("color","red");
                window.parent.leftFrame.location.href = "${path}/baseFunction/midlist.action?mid="+mid;
                window.parent.mainFrame.location.href = "${path}/jsp/index/main.jsp";
            })
        })
    </script>
    <style>
        span{
            font-size: 14px;
            margin-left: 10px;
        }
    </style>
</head>

<body>
<div class="page">
        <div class="nav">
                <%--<a href="#"  target="_self"><SPAN class=STYLE2>收费管理</SPAN></a>--%>
                <%--<a href="#"  target="_self"><SPAN class=STYLE2>药房管理</SPAN></a>--%>
                <%--<a href="#"  target="_self"><SPAN class=STYLE2>医生工作站</SPAN></a>--%>
                <%--<a href="#"  target="_self"><SPAN class=STYLE2>基础信息</SPAN></a>--%>
                <%--<a href="#"  target="_self"><SPAN class=STYLE2>统计分析</SPAN></a>--%>
        </div>
</div>
<div class="userInfo">
    <span>${bucct.cname}</span>
    <span>2018年11月20号</span>
    <span><a href="" id="log">退出</a></span>
    <span><a href="" id="changePassword">修改密码</a></span>
</div>

</body>

</html>
