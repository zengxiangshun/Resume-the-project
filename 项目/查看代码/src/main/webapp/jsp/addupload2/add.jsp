<%-- 
  Created by IntelliJ IDEA. 
  2018/12/24 
  To change this template use File | Settings | File Templates. 
--%> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@include file="/common/common.jsp"%> 
<html> 
<head> 
    <title>Title</title>
</head> 

<body class="main"> 
<form action="${path}/addupload/insert.action"> 
    <h1>添加上传</h1> 
    <div class="update"> 
        <div class="left"> 
            <span>文件名</span> 
            <input type="text" name="name" value=""> 
        </div> 
        <div class="right"> 
            <span>文件大小</span> 
            <input type="text" name="size" value=""> 
        </div> 
        <div class="left"> 
            <span>上传时间</span> 
            <input type="date" name="todate" value=""> 
        </div>
        <div class="left">
            <span>用户id</span>
            <input type="text" name="userId" value="${bucct.userId}">
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
 
