<%-- 
  Created by IntelliJ IDEA. 
  2018/12/19 
  To change this template use File | Settings | File Templates. 
--%> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@include file="/common/common.jsp"%> 
<html> 
<head> 
    <script type="text/javascript"> 
        $(function () { 
            $("#addBtn").click(function () { 
                location.href="${path}/doctorMenuMedicine/load2.action";
             })
            $(".update").click(function () { 
                var mdId = $(this).attr("name");
                location.href="${path}/doctorMenuMedicine/load.action?mdId="+mdId;
             })
            $(".delete").click(function () { 
                var mdId = $(this).attr("name");
                location.href="${path}/doctorMenuMedicine/delete.action?mdId="+mdId;
             })
            $("#search").click(function () { 
                var codeId = $("#Codeid").val();
                location.href = "${path}/doctorMenuMedicine/search.action?codeId="+codeId;
             })
        })  
    </script> 
</head> 
<body class="main"> 
    <div class="search"> 
        <span> 
            <%--套餐：<input type="text" id="menuId" value="${searchObject.menuId}">--%>
            药品：
            <select id="Codeid" value="">
                <c:forEach items="${mc}" var="mc">
                    <c:if test="${searchObject.codeId==mc.codeId}">
                        <option value="${mc.codeId}">${mc.medicineName}</option>
                    </c:if>
                </c:forEach>
                <option></option>
                <c:forEach items="${mc}" var="mc">
                    <c:if test="${searchObject.codeId!=mc.codeId}">
                        <option value="${mc.codeId}">${mc.medicineName}</option>
                    </c:if>
                </c:forEach>
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
            <td>套餐</td> 
            <td>药品</td> 
            <td>数量</td> 
            <td>编辑</td> 
            <td>删除</td> 
        </thead> 
        <c:forEach items="${list}" var="doctorMenuMedicine" varStatus="status"> 
            <tr> 
                <td>${status.index+1}</td> 
                <td><%--${doctorMenuMedicine.menuId}--%>
                    <c:forEach items="${dm}" var="mds">
                        <c:if test="${mds.menuId==MedID}">
                            ${mds.menuName}
                        </c:if>
                    </c:forEach>
                </td>
                <td><%--${doctorMenuMedicine.codeId}--%>
                    <c:forEach items="${mc}" var="mcs">
                        <c:if test="${mcs.codeId==doctorMenuMedicine.codeId}">
                            ${mcs.medicineName}
                        </c:if>
                    </c:forEach>
                </td>
                <td>${doctorMenuMedicine.amt}</td> 
                <td><img src="${path}/images/edit.gif" class="update" name="${doctorMenuMedicine.mdId}"></td> 
                <td><img src="${path}/images/del.gif" class="delete" name="${doctorMenuMedicine.mdId}"></td> 
            </tr> 
        </c:forEach> 
    </table> 
</body> 
</html> 
