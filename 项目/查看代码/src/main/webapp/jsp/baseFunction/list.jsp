<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/25 0025
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/common.jsp"%>
<html>
<head>
    <title>Title</title>

    <script>
        $(function () {
            $("#addBtn").click(function () {
                location.href="${path}/jsp/baseFunction/add.jsp";
            })
            $(".update").click(function () {
                var fid = $(this).attr("name");
                location.href="${path}/baseFunction/load.action?fid="+fid;
            })
            $(".delete").click(function () {
                var fid = $(this).attr("name");
                location.href="${path}/baseFunction/delete.action?fid="+fid;
            })
            $("#search").click(function () {
                var fname = $("#fname").val();
                var mid = $("#mid").val();
                location.href = "${path}/baseFunction/lists.action?fname="+fname+"&mid="+mid;
            })

            $.get("${path}/baseModule/toplist.action",function (data) {
                var $s = $("#mid");
                var a = "${searchObject.mid}";
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
    <div class="search">
        <span>
            功能名： <input type="text" id="fname" value="${searchObject.fname}">
        </span>
        <span>
            模块名：<select id="mid" name="mid">

            </select>
        </span>
        <span>
            <button id="search">查询</button>
        </span>
        <span>
            <button id="addBtn">增加</button>
        </span>
    </div>
    <table>
        <thead>
            <td>序号</td>
            <td>类别</td>
            <td>模块名</td>
            <td>url</td>
            <td>修改</td>
            <td>删除</td>
        </thead>
        <c:forEach items="${list}" var="baseFunction" varStatus="status">
            <tr>
                <td>${status.index+1}</td>
                <td>${baseFunction.fname}</td>
                <td>${baseFunction.baseModule.mname}</td>
                <td>${baseFunction.url}</td>
                <td><img src="${path}/images/edit.gif" class="update" name="${baseFunction.fid}"></td>
                <td><img src="${path}/images/del.gif" class="delete" name="${baseFunction.fid}"></td>
            </tr>
        </c:forEach>
    </table>


</body>
</html>
