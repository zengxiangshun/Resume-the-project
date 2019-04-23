<%-- 
  Created by IntelliJ IDEA. 
  2018/12/27 
  To change this template use File | Settings | File Templates. 
--%> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@include file="/common/common.jsp"%> 
<html> 
<head> 
    <script type="text/javascript">
        function init(o)
        {
            var a =document.getElementById('a');
//            var b =document.getElementById('label')
            for(var i=0;i<a.options.length;i++)
                if (a.options[i].innerHTML==o.value){
                    a.selectedIndex=i;
//                    b.innerHTML= "value="+a.options[i].value;
                    return;
                    break;
                }
            a.selectedIndex=0;
//            b.innerHTML= "";
        }
        $(function () { 
            $("#addBtn").click(function () { 
                location.href="${path}/jsp/doctorVisitRecord/add.jsp";
             })
            $(".update").click(function () { 
                var vrId = $(this).attr("name");
                location.href="${path}/doctorVisitRecordinfo/list.action?vrId="+vrId;
             })
            $(".delete").click(function () { 
                var vrId = $(this).attr("name");
                location.href="${path}/doctorVisitRecord/delete.action?vrId="+vrId;
             })
            $("#search").click(function () { 
                var patientId = $("#a").val();
                location.href = "${path}/doctorVisitRecord/search.action?patientId="+patientId;
             })
        })  
    </script> 
</head> 
<body class="main"> 
    <div class="search"> 
        <span> 
            病人：<%--<input type="text" id="vrId" value="${searchObject.vrId}">--%>
            <select name="patientId" id="a" required style="width: 100px">

                <c:forEach items="${bp}" var="prrs">
                    <c:if test="${searchObject.patientId==prrs.patientId}">
                        <option value="${prrs.patientId}">${prrs.patientName}</option>
                    </c:if>
                </c:forEach>
                <option></option>
                <c:forEach items="${bp}" var="prrs">
                    <c:if test="${searchObject.patientId!=prrs.patientId}">
                        <option value="${prrs.patientId}">${prrs.patientName}</option>
                    </c:if>
                </c:forEach>
            </select>
            <input type="text" name="b" id="b" style="width: 100px" onkeyup="init(this)"/>
        </span> 
        <span> 
            <button id="search">查询</button> 
        </span> 
        <%--<span> --%>
            <%--<button id="addBtn">增加</button> --%>
        <%--</span> --%>
    </div> 
    <table> 
        <thead> 
            <td>序号</td> 
            <td>病人</td> 
            <td>医生</td> 
            <td>就诊时间</td> 
            <td>症状</td> 
            <td>医生建议</td> 
            <td>就诊次数</td> 
            <td>状态(1:已就诊2:已缴费3:已领药)</td> 
            <td>药品查询</td>
            <td>删除</td> 
        </thead> 
        <c:forEach items="${list}" var="doctorVisitRecord" varStatus="status"> 
            <tr> 
                <td>${status.index+1}</td> 
                <td>
                    <c:forEach items="${bp}" var="bps">
                        <c:if test="${doctorVisitRecord.patientId==bps.patientId}">
                            ${bps.patientName}
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach items="${bu}" var="bus">
                        <c:if test="${doctorVisitRecord.doctorId==bus.userId}">
                            ${bus.cname}
                        </c:if>
                    </c:forEach>
                </td>
                <td>${doctorVisitRecord.visitDate}</td> 
                <td>${doctorVisitRecord.symptom}</td> 
                <td>${doctorVisitRecord.advice}</td> 
                <td>${doctorVisitRecord.times}</td> 
                <td>
                    <c:if test="${doctorVisitRecord.status==1}">
                        已就诊
                    </c:if>
                    <c:if test="${doctorVisitRecord.status==2}">
                        已缴费
                    </c:if>
                    <c:if test="${doctorVisitRecord.status==3}">
                        已领药
                    </c:if>
                </td>
                <td><img src="${path}/images/distribute.gif" class="update" name="${doctorVisitRecord.vrId}"></td>
                <td><img src="${path}/images/del.gif" class="delete" name="${doctorVisitRecord.vrId}"></td> 
            </tr> 
        </c:forEach> 
    </table> 
</body> 
</html> 
