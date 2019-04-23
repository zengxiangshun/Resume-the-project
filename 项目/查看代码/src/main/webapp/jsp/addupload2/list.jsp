<%-- 
  Created by IntelliJ IDEA. 
  2018/12/24 
  To change this template use File | Settings | File Templates. 
--%> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@include file="/common/common.jsp"%> 
<html> 
<head> 
    <script type="text/javascript"> 
        $(function () { 
            $("#addBtn").click(function () { 
                location.href="${path}/jsp/addupload2/add.jsp";
             })
            $("#delBtn").click(function () {
                var a=[];
                $(".che:checked").each(function () {
                    var b = $(this).attr("name")
                    a.push(b);
                })
                var c = a.join(",");
                if(c!=""){
                    location.href = "${path}/addupload2/delBtn.action?aee="+c;
                }else {
                    alert("请选中")
                }
             })
            $(".update").click(function () { 
                var id = $(this).attr("name");
                location.href="${path}/addupload2/load.action?id="+id;
             })
            $(".delete").click(function () { 
                var id = $(this).attr("name");
                location.href="${path}/addupload2/delete.action?id="+id;
             })
            $("#search").click(function () { 
                var name = $("#name").val();
                location.href = "${path}/addupload2/search.action?name="+name;
             })
        })  
    </script> 
</head> 
<body class="main"> 
    <div class="search"> 
        <span> 
            文件名：<input type="text" id="name" value="${searchObject.name}"> 
        </span> 
        <span> 
            <button id="search">查询</button> 
        </span> 
        <span> 
            <button id="addBtn">增加</button> 
        </span>
        <span>
            <button id="delBtn">批量删除</button>
        </span>
    </div> 
    <table> 
        <thead> 
            <td></td>
            <td>序号</td>
            <td>文件名</td>
            <td>文件大小</td> 
            <td>上传时间</td> 
            <td>用户id</td>
            <td>编辑</td>
            <td>删除</td> 
        </thead> 
        <c:forEach items="${list}" var="addupload" varStatus="status"> 
            <tr>
                <td><input type="checkbox" class="che" name="${addupload.id}"></td>
                <td>${status.index+1}</td> 
                <td>${addupload.name}</td> 
                <td>${addupload.size}</td> 
                <td>${addupload.todate}</td> 
                <td>${addupload.baseUser.cname}</td>
                <td><img src="${path}/images/edit.gif" class="update" name="${addupload.id}"></td>
                <td><img src="${path}/images/del.gif" class="delete" name="${addupload.id}"></td> 
            </tr> 
        </c:forEach> 
    </table> 
</body> 
</html> 
