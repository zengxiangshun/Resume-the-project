<%-- 
  Created by IntelliJ IDEA. 
  2019/01/28 
  To change this template use File | Settings | File Templates. 
--%> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@include file="/common/common.jsp"%> 
<html> 
<head> 
    <script type="text/javascript"> 
        $(function () { 
            $("#addBtn").click(function () { 
                location.href="${path}/jsp/chargeRecordinfo/add.jsp";
             })
            $(".update").click(function () { 
                var chargeInfoid = $(this).attr("name");
                location.href="${path}/chargeRecordinfo/load.action?chargeInfoid="+chargeInfoid;
             })
            $(".delete").click(function () { 
                var chargeInfoid = $(this).attr("name");
                location.href="${path}/chargeRecordinfo/delete.action?chargeInfoid="+chargeInfoid;
             })
            $("#search").click(function () { 
                var chargeId = $("#chargeId").val();
                location.href = "${path}/chargeRecordinfo/search.action?chargeId="+chargeId;
             })
        })  
    </script> 
</head> 
<body class="main"> 
    <div class="search"> 
        <span> 
            收费记录：<input type="text" id="chargeId" value="${searchObject.chargeId}"> 
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
            <td>收费记录</td> 
            <td>药品</td> 
            <td>单价</td> 
            <td>数量</td> 
            <td>编辑</td> 
            <td>删除</td> 
        </thead> 
        <c:forEach items="${list}" var="chargeRecordinfo" varStatus="status"> 
            <tr> 
                <td>${status.index+1}</td> 
                <td>${chargeRecordinfo.chargeId}</td> 
                <td>${chargeRecordinfo.codeId}</td> 
                <td>${chargeRecordinfo.unitprc}</td> 
                <td>${chargeRecordinfo.amt}</td> 
                <td><img src="${path}/images/edit.gif" class="update" name="${chargeRecordinfo.chargeInfoid}"></td> 
                <td><img src="${path}/images/del.gif" class="delete" name="${chargeRecordinfo.chargeInfoid}"></td> 
            </tr> 
        </c:forEach> 
    </table> 
</body> 
</html> 
