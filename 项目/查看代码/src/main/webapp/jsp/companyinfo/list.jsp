<%-- 
  Created by IntelliJ IDEA. 
  2018/12/05 
  To change this template use File | Settings | File Templates. 
--%> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@include file="/common/common.jsp"%> 
<html> 
<head> 
    <script type="text/javascript"> 
        $(function () {
            $("#addBtn").click(function () {
                var cid = $(".che:checked").val();
                if (cid==null||cid==""){
                    alert("请选择要添加的公司回访记录")
                }else {
                    location.href = "${path}/telvisit/loadTel.action?cid="+cid;

                }
             })
            $(".update").click(function () { 
                var cid = $(this).attr("name");
                location.href="${path}/companyinfo/load.action?cid="+cid;
             })
            $(".delete").click(function () { 
                var cid = $(this).attr("name");
                location.href="${path}/companyinfo/delete.action?cid="+cid;
             })
            $("#search").click(function () { 
                var compname = $("#compname").val();
                var ownername = $("#ownername").val();
                location.href = "${path}/companyinfo/search.action?compname="+compname+"&ownername="+ownername;
             })
            $(".tel").click(function () {
                var cid = $(this).attr("name");
                location.href = "${path}/telvisit/listTel.action?cid="+cid;
             })
        })  
    </script> 
</head> 
<body class="main"> 
    <div class="search"> 
        <span> 
            公司名称：<input type="text" id="compname" value="${searchObject.compname}"> 
        </span>
        <span>
            公司名称：<input type="text" id="ownername" value="${searchObject.ownername}">
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
            <td></td>
            <td>序号</td>
            <td>公司名称</td>
            <td>法人姓名</td> 
            <td>法人电话</td> 
            <td>公司简介</td>
            <td>操作</td>
            <td>编辑</td>
            <td>删除</td> 
        </thead> 
        <c:forEach items="${list}" var="companyinfo" varStatus="status"> 
            <tr> 
                <td><input type="radio" name="che" class="che" value="${companyinfo.cid}"></td>
                <td>${status.index+1}</td>
                <td>${companyinfo.compname}</td>
                <td>${companyinfo.ownername}</td> 
                <td>${companyinfo.ownertel}</td> 
                <td>${companyinfo.compinfo}</td> 
                <td><a href="#" class="tel" name="${companyinfo.cid}">查询所有回访记录</a></td>
                <td><img src="${path}/images/edit.gif" class="update" name="${companyinfo.cid}"></td>
                <td><img src="${path}/images/del.gif" class="delete" name="${companyinfo.cid}"></td> 
            </tr> 
        </c:forEach> 
    </table> 
</body> 
</html> 
