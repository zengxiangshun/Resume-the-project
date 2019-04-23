<%-- 
  Created by IntelliJ IDEA. 
  2019/01/25 
  To change this template use File | Settings | File Templates. 
--%> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@include file="/common/common.jsp"%> 
<html> 
<head> 
    <script type="text/javascript"> 
        $(function () { 
            $("#addBtn").click(function () { 
                location.href="${path}/jsp/doctorVisitRecordinfo/add.jsp";
             })
            $(".update").click(function () { 
                var infoId = $(this).attr("name");
                location.href="${path}/doctorVisitRecordinfo/load.action?infoId="+infoId;
             })
            $(".delete").click(function () { 
                var infoId = $(this).attr("name");
                location.href="${path}/doctorVisitRecordinfo/delete.action?infoId="+infoId;
             })
            $("#search").click(function () { 
                var vrId = $("#vrId").val();
                location.href = "${path}/doctorVisitRecordinfo/search.action?vrId="+vrId;
             })
            $("#qe").click(function () {
                var nu = "${vrId}/";
               $(".sj").each(function () {
                   var attr = $(this).attr("name");
                   nu+=attr+"/";
               })
                location.href = "${path}/chargeRecord/adds.action?nu="+nu;
             })
        })  
    </script> 
</head> 
<body class="main"> 
    <div class="search">
        <%--<span> --%>
            <%--就诊记录ID：<input type="text" id="vrId" value="${searchObject.vrId}"> --%>
        <%--</span> --%>
        <%--<span> --%>
            <%--<button id="search">查询</button> --%>
        <%--</span> --%>
        <span>
            <button onclick="history.back()">返回</button>
        </span>
    </div>
    <table> 
        <thead> 
            <td>序号</td> 
            <%--<td>就诊记录ID</td> --%>
            <td>药品</td> 
            <td>药品数量</td> 
            <td>药品单价</td>
            <%--<td>编辑</td> --%>
            <%--<td>删除</td> --%>
        </thead> 
        <c:forEach items="${list}" var="doctorVisitRecordinfo" varStatus="status"> 
            <tr> 
                <td>${status.index+1}</td> 
                <%--<td>${doctorVisitRecordinfo.vrId}</td> --%>
                <c:forEach items="${mc}" var="mcs">
                    <c:if test="${doctorVisitRecordinfo.codeId==mcs.codeId}">
                        <td>${mcs.medicineName}</td>
                    </c:if>
                </c:forEach>
                <td>${doctorVisitRecordinfo.amt}</td>
                <c:forEach items="${ms}" var="mss">
                    <c:if test="${doctorVisitRecordinfo.codeId==mss.medicinecodeId}">
                        <td>${mss.saleunitprc}</td>
                        <input type="hidden" name="${doctorVisitRecordinfo.codeId},${doctorVisitRecordinfo.amt},${mss.saleunitprc}" class="sj">
                    </c:if>
                </c:forEach>
                <%--<td><img src="${path}/images/edit.gif" class="update" name="${doctorVisitRecordinfo.infoId}"></td> --%>
                <%--<td><img src="${path}/images/del.gif" class="delete" name="${doctorVisitRecordinfo.infoId}"></td> --%>
            </tr> 
        </c:forEach> 
    </table>
    <div class="search">
        <center>
            <span>
            <button style="margin-top: 20px" id="qe">确认收费</button>
        </span>
        </center>
    </div>
</body> 
</html> 
