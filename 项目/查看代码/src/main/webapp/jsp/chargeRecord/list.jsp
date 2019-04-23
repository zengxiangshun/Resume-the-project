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
                location.href="${path}/jsp/chargeRecord/add.jsp";
             })
            $(".update").click(function () { 
                var chargeId = $(this).attr("name");
                location.href="${path}/chargeRecord/load.action?chargeId="+chargeId;
             })
            $(".delete").click(function () { 
                var chargeId = $(this).attr("name");
                location.href="${path}/chargeRecord/delete.action?chargeId="+chargeId;
             })
            $("#search").click(function () { 
                var patientId = $("#patientId").val();
                location.href = "${path}/chargeRecord/search.action?patientId="+patientId;
             })
        })  
    </script> 
</head> 
<body class="main"> 
    <div class="search"> 
        <span> 
            病人：<input type="text" id="patientId" value="${searchObject.patientId}"> 
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
            <td>病人</td> 
            <td>医生</td> 
            <td>总金额</td> 
            <td>收费日期</td> 
            <td>收费人</td> 
            <td>编辑</td> 
            <td>删除</td> 
        </thead> 
        <c:forEach items="${list}" var="chargeRecord" varStatus="status"> 
            <tr> 
                <td>${status.index+1}</td>
                <c:forEach items="${bp}" var="bps">
                    <c:if test="${chargeRecord.patientId==bps.patientId}">
                        <td>${bps.patientName}</td>
                    </c:if>
                </c:forEach>
                <c:forEach items="${bu}" var="bus">
                    <c:if test="${chargeRecord.doctorId==bus.userId}">
                        <td>${bus.cname}</td>
                    </c:if>
                </c:forEach>
                <td>${chargeRecord.amount}</td> 
                <td>${chargeRecord.chargeDate}</td>
                <c:forEach items="${bu}" var="bus">
                    <c:if test="${chargeRecord.chargeUser==bus.userId}">
                        <td>${bus.cname}</td>
                    </c:if>
                </c:forEach>
                <td><img src="${path}/images/edit.gif" class="update" name="${chargeRecord.chargeId}"></td> 
                <td><img src="${path}/images/del.gif" class="delete" name="${chargeRecord.chargeId}"></td> 
            </tr> 
        </c:forEach> 
    </table> 
</body> 
</html> 
