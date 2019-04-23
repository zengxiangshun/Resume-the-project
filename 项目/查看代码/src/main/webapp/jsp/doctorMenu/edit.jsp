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
<form action="${path}/doctorMenu/update.action"> 
    <h1>修改套餐管理</h1> 
    <input type="hidden" name="menuId" value="${doctorMenu.menuId}"> 
    <div class="update"> 
        <div class="left"> 
            <span>套餐名称</span> 
            <input type="text" name="menuName" value="${doctorMenu.menuName}">
        </div>
        <div class="right"> 
            <span>用户</span> 
            <%--<input type="text" name="userId" value="${doctorMenu.userId}">--%>
            <c:forEach items="${bus}" var="bu">
                <c:if test="${doctorMenu.userId==bu.userId}">
                    <input disabled type="text" value="${bu.cname}">
                    <input  type="hidden" name="userId" value="${bu.userId}">
                </c:if>
            </c:forEach>
        </div> 
        <div class="left"> 
            <span>套餐描述</span> 
            <input type="text" name="description" value="${doctorMenu.description}"> 
        </div> 
        <div class="right"> 
            <span>套餐类型</span> 
            <%--<input type="text" name="type" value="${doctorMenu.type}"> --%>
            <select name="type">
                <c:if test="${doctorMenu.type==1}">
                    <option value="1">套餐仅自己可用</option>
                    <option value="2">套餐全科室都可用</option>
                    <option value="3">套餐所有医生都可用</option>
                </c:if>
                <c:if test="${doctorMenu.type==2}">
                    <option value="2">套餐全科室都可用</option>
                    <option value="1">套餐仅自己可用</option>
                    <option value="3">套餐所有医生都可用</option>
                </c:if>
                <c:if test="${doctorMenu.type==3}">
                    <option value="3">套餐所有医生都可用</option>
                    <option value="1">套餐仅自己可用</option>
                    <option value="2">套餐全科室都可用</option>
                </c:if>
            </select>
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
 
