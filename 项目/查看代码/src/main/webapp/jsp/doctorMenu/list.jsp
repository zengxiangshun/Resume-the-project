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
                location.href="${path}/jsp/doctorMenu/add.jsp";
             })
            $(".update").click(function () {
                var menuId = $(this).attr("name");
                var user = ${bucct.userId};
                //a，类型，用户id
                var a = $(this).parent().attr("name");
                var arr = a.split(":");
                if (arr[0]==1 && user==arr[1]){
                    location.href="${path}/doctorMenu/load.action?menuId="+menuId;
                }else if (arr[0]==3){
                    location.href="${path}/doctorMenu/load.action?menuId="+menuId;
                }else if (arr[0]==2){
                    location.href="${path}/doctorMenu/loads.action?menuId="+menuId+"&userId="+arr[1];
                }else {
                    alert("你没有权限")
                }
             })
            $(".delete").click(function () { 
                var menuId = $(this).attr("name");
                var user = ${bucct.userId};
                var a = $(this).parent().attr("name");
                var arr = a.split(":");
                if (arr[0]==1 && user==arr[1]){
                    location.href="${path}/doctorMenu/deletes.action?menuId="+menuId;

                }else if (arr[0]==3){
                    location.href="${path}/doctorMenu/deletes.action?menuId="+menuId;

                }else if (arr[0]==2){
                    location.href="${path}/doctorMenu/delete.action?menuId="+menuId+"&userId="+arr[1];
                }else {
                    alert("你没有权限")
                }
             })
            $(".medicine").click(function () {
                var menuId = $(this).attr("name");
                var user = ${bucct.userId};
                var a = $(this).parent().attr("name");
                var arr = a.split(":");
                if (arr[0]==1 && user==arr[1]){
                    location.href="${path}/doctorMenuMedicine/list.action?id="+menuId;

                }else if (arr[0]==3){
                    location.href="${path}/doctorMenuMedicine/list.action?id="+menuId;

                }else if (arr[0]==2){
                    location.href="${path}/doctorMenuMedicine/lists.action?id="+menuId+"&userId="+arr[1];
                }else {
                    alert("你没有权限")
                }
             })
            $("#search").click(function () { 
                var menuName = $("#menuName").val();
                location.href = "${path}/doctorMenu/search.action?menuName="+menuName;
             })
        })  
    </script> 
</head> 
<body class="main"> 
    <div class="search"> 
        <span> 
            套餐名称：<input type="text" id="menuName" value="${searchObject.menuName}"> 
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
            <td>套餐名称</td> 
            <td>用户</td> 
            <td>套餐描述</td> 
            <td>套餐类型</td> 
            <td>编辑</td> 
            <td>删除</td>
            <td>管理药品</td>
        </thead>
        <c:forEach items="${list}" var="doctorMenu" varStatus="status"> 
            <tr> 
                <td>${status.index+1}</td> 
                <td>${doctorMenu.menuName}</td> 
                <td><%--${doctorMenu.userId}--%>
                    <c:forEach items="${bus}" var="bu">
                        <c:if test="${doctorMenu.userId==bu.userId}">
                            ${bu.cname}
                        </c:if>
                    </c:forEach>
                </td>
                <td>${doctorMenu.description}</td> 
                <td><%--${doctorMenu.type}--%>
                    <c:if test="${doctorMenu.type==1}">
                        套餐仅自己可用
                    </c:if>
                    <c:if test="${doctorMenu.type==2}">
                        套餐全科室都可用
                    </c:if>
                    <c:if test="${doctorMenu.type==3}">
                        套餐所有医生都可用
                    </c:if>
                </td>
                <td name="${doctorMenu.type}:${doctorMenu.userId}"><img src="${path}/images/edit.gif" class="update" name="${doctorMenu.menuId}"></td>
                <td name="${doctorMenu.type}:${doctorMenu.userId}"><img src="${path}/images/del.gif" class="delete" name="${doctorMenu.menuId}"></td>
                <td name="${doctorMenu.type}:${doctorMenu.userId}"><img src="${path}/images/distribute.gif" class="medicine" name="${doctorMenu.menuId}"></td>
            </tr>
        </c:forEach> 
    </table> 
</body> 
</html> 
