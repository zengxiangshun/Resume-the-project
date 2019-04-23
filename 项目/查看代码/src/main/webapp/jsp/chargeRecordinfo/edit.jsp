<%-- 
  Created by IntelliJ IDEA. 
  2019/01/28 
  To change this template use File | Settings | File Templates. 
--%> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@include file="/common/common.jsp"%> 
<html> 
<head> 
    <title>Title</title>
</head> 

<body class="main"> 
<form action="${path}/chargeRecordinfo/update.action"> 
    <h1>修改收费详情</h1> 
    <input type="hidden" name="chargeInfoid" value="${chargeRecordinfo.chargeInfoid}"> 
    <div class="update"> 
        <div class="left"> 
            <span>收费记录</span> 
            <input type="text" name="chargeId" value="${chargeRecordinfo.chargeId}"> 
        </div> 
        <div class="right"> 
            <span>药品</span> 
            <input type="text" name="codeId" value="${chargeRecordinfo.codeId}"> 
        </div> 
        <div class="left"> 
            <span>单价</span> 
            <input type="text" name="unitprc" value="${chargeRecordinfo.unitprc}"> 
        </div> 
        <div class="right"> 
            <span>数量</span> 
            <input type="text" name="amt" value="${chargeRecordinfo.amt}"> 
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
 
