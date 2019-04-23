<%-- 
  Created by IntelliJ IDEA. 
  2018/12/19 
  To change this template use File | Settings | File Templates. 
--%> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@include file="/common/common.jsp"%> 
<html> 
<head> 
    <title>Title</title>
</head> 

<body class="main"> 
<form action="${path}/doctorMenuMedicine/insert.action"> 
    <h1>添加套餐药品增加</h1> 
    <div class="update"> 
        <div class="left"> 
            <span>套餐</span> 
            <input type="hidden" name="menuId" value="${MedID}">
            <c:forEach items="${dm}" var="dms">
                <c:if test="${dms.menuId==MedID}">
                    <input type="text" readonly value="${dms.menuName}">
                </c:if>
            </c:forEach>
        </div> 
        <div class="right"> 
            <span>药品</span> 
            <%--<input type="text" name="codeId" value=""> --%>
            <select name="codeId">
                <c:forEach items="${mc}" var="mcs">
                    <option value="${mcs.codeId}">${mcs.medicineName}</option>
                </c:forEach>
            </select>
        </div> 
        <div class="left"> 
            <span>数量</span> 
            <input type="text" name="amt" value=""> 
        </div> 
        <div class="right"> 
        </div> 
        <div id="error"></div> 
        <div class="buttons"> 
            <input type="submit" value="提交"> 
            <input type="button" onclick="history.back()" value="返回"> 
        </div> 
    </div> 
</form> 
</body> 
</html> 
 
