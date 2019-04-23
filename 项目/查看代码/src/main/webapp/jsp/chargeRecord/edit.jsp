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
<form action="${path}/chargeRecord/update.action"> 
    <h1>修改收费记录</h1> 
    <input type="hidden" name="chargeId" value="${chargeRecord.chargeId}"> 
    <div class="update"> 
        <div class="left"> 
            <span>病人</span> 
            <input type="text" name="patientId" value="${chargeRecord.patientId}"> 
        </div> 
        <div class="right"> 
            <span>医生</span> 
            <input type="text" name="doctorId" value="${chargeRecord.doctorId}"> 
        </div> 
        <div class="left"> 
            <span>总金额</span> 
            <input type="text" name="amount" value="${chargeRecord.amount}"> 
        </div> 
        <div class="right"> 
            <span>收费日期</span> 
            <input type="date" name="chargeDate" value="${chargeRecord.chargeDate}"> 
        </div> 
        <div class="left"> 
            <span>收费人</span> 
            <input type="text" name="chargeUser" value="${chargeRecord.chargeUser}"> 
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
 
