<%-- 
  Created by IntelliJ IDEA. 
  2018/12/21 
  To change this template use File | Settings | File Templates. 
--%> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@include file="/common/common.jsp"%> 
<html> 
<head> 
    <script type="text/javascript"> 
        $(function () { 
            $("#addBtn").click(function () { 
                location.href="${path}/patientRegisterRecord/loads.action";
             })
            $(".update").click(function () { 
                var registerId = $(this).attr("name");
                location.href="${path}/patientRegisterRecord/load.action?registerId="+registerId;
             })
            $(".delete").click(function () { 
                var registerId = $(this).attr("name");
                location.href="${path}/patientRegisterRecord/delete.action?registerId="+registerId;
             })
            $("#search").click(function () { 
                var patientId = $("#patientId").val();
                location.href = "${path}/patientRegisterRecord/search.action?patientId="+patientId;
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
            <td>部门</td> 
            <td>挂号时间</td> 
            <td>挂号人</td> 
            <td>医生</td> 
            <td>状态</td> 
            <%--<td>编辑</td> --%>
            <td>删除</td> 
        </thead> 
        <c:forEach items="${list}" var="patientRegisterRecord" varStatus="status"> 
            <tr> 
                <td>${status.index+1}</td> 
                <td><%--${patientRegisterRecord.patientId}--%>
                    <c:forEach items="${bp}" var="bps">
                        <c:if test="${bps.patientId==patientRegisterRecord.patientId}">
                            ${bps.patientName}
                        </c:if>
                    </c:forEach>
                </td>
                <td><%--${patientRegisterRecord.deptId}--%>
                    <c:forEach items="${bd}" var="bds">
                        <c:if test="${bds.deptId==patientRegisterRecord.deptId}">
                            ${bds.deptName}
                        </c:if>
                    </c:forEach>
                </td>
                <td>${patientRegisterRecord.registerDate}</td> 
                <td><%--${patientRegisterRecord.recordUser}--%>
                    <c:forEach items="${bu}" var="bus">
                        <c:if test="${bus.userId==patientRegisterRecord.recordUser}">
                            ${bus.cname}
                        </c:if>
                    </c:forEach>
                </td>
                <td><%--${patientRegisterRecord.doctorId}--%>
                    <c:forEach items="${bu}" var="bus">
                        <c:if test="${bus.userId==patientRegisterRecord.doctorId}">
                            ${bus.cname}
                        </c:if>
                    </c:forEach>
                </td>
                <td><%--${patientRegisterRecord.status}--%>
                    <c:if test="${patientRegisterRecord.status==1}">
                        已挂号
                    </c:if>
                    <c:if test="${patientRegisterRecord.status==2}">
                        已就诊
                    </c:if>
                </td>
                <%--<td><img src="${path}/images/edit.gif" class="update" name="${patientRegisterRecord.registerId}"></td> --%>
                <td><img src="${path}/images/del.gif" class="delete" name="${patientRegisterRecord.registerId}"></td> 
            </tr> 
        </c:forEach> 
    </table> 
</body> 
</html> 
