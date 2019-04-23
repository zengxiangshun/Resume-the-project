<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA. 
  2018/12/21 
  To change this template use File | Settings | File Templates. 
--%> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@include file="/common/common.jsp"%> 
<html> 
<head> 
    <title>Title</title>
    <%
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String format = simpleDateFormat.format(new Date());
    %>
    <script>
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
            $("#deptId").change(function () {
                var a = $(this).val();
                var $doctorId = $("#doctorId");
                if (a!=null && a!=""){
                    $.get("${path}/patientRegisterRecord/ajaxload.action",{a:a},function (data) {
                        $("#doctorId").html("");
                        var $opens = $("<option ></option>");
                        $opens.appendTo($doctorId);
                        $(data).each(function () {
                            var $open = $("<option value='"+this.userId+"'>"+this.cname+"</option>")
                            $open.appendTo($doctorId)
                        })
                    },"json")
                }else {
                    $("#doctorId").html("");
                }
            })
            $("#a").change(function () {
                var a = $(this).val();
                if (a!=null && a!=""){
                    $.get("${path}/basePatientInfo/ajaxload.action",{a:a},function (data) {
                        var $update = $("#information");
                        $update.html("");
                        var $2 = $("<span class='left'>日期：<span style='color: red'>"+data.birth+"</span></span>");
                        $update.append($2);
                        var $3 = $("<span class='right'>性别：<span style='color: red'>"+data.sex+"</span></span>");
                        $update.append($3);
                        var $4 = $("<span class='left'>地址：<span style='color: red'>"+data.address+"</span></span>");
                        $update.append($4);
                        var $5 = $("<span class='right'>电话：<span style='color: red'>"+data.phonenum+"</span></span>");
                        $update.append($5);
                        var $6 = $("<span class='left'>身份证号：<span style='color: red'>"+data.personid+"</span></span>");
                        $update.append($6);
                    },"json")
                }
            })

            $("#b").keyup(function () {
                var c = $("#a").val();
                if (c!=null&&c!=""){
                    $.get("${path}/basePatientInfo/ajaxload.action",{a:c},function (data) {
                        var $update = $("#information");
                        $update.html("");
                        var $2 = $("<span class='left'>日期：<span style='color: red'>"+data.birth+"</span></span>");
                        $update.append($2);
                        var $3 = $("<span class='right'>性别：<span style='color: red'>"+data.sex+"</span></span>");
                        $update.append($3);
                        var $4 = $("<span class='left'>地址：<span style='color: red'>"+data.address+"</span></span>");
                        $update.append($4);
                        var $5 = $("<span class='right'>电话：<span style='color: red'>"+data.phonenum+"</span></span>");
                        $update.append($5);
                        var $6 = $("<span class='left'>身份证号：<span style='color: red'>"+data.personid+"</span></span>");
                        $update.append($6);
                    },"json")
                }
            })

        })
    </script>

</head> 

<body class="main"> 
<form action="${path}/patientRegisterRecord/insert.action"> 
    <h1>添加挂号</h1> 
    <div class="update"> 
        <div class="left">
            <span>病人</span> 
            <%--<input type="text" name="patientId" value="">--%>
            <select name="patientId" id="a" required style="width: 100px">
                <option></option>
                <c:forEach items="${prr}" var="prrs">
                    <option value="${prrs.patientId}">${prrs.patientName}</option>
                </c:forEach>
            </select>
            <input type="text" name="b" id="b" style="width: 100px" onkeyup="init(this)" />
        </div> 
        <div class="right"> 
            <span>部门</span> 
            <%--<input type="text" name="deptId" value=""> --%>
            <select name="deptId" id="deptId" required>
                <option></option>
                <c:forEach items="${bd}" var="bds">
                    <option value="${bds.deptId}">${bds.deptName}</option>
                </c:forEach>
            </select>
        </div> 
        <div class="left"> 
            <span>挂号时间</span> 
            <input type="date" name="registerDate" value="<%=format%>">
        </div> 
        <div class="right"> 
            <span>挂号人</span> 
            <%--<input type="text" name="recordUser" value="">--%>
            <input type="text" readonly="readonly" value="${bucct.cname}">
            <input type="hidden" name="recordUser" value="${bucct.userId}">
        </div> 
        <div class="left"> 
            <span>医生</span> 
            <%--<input type="text" name="doctorId" value="">--%>
            <select name="doctorId" id="doctorId">
                <option></option>
                <%--<c:forEach items="${bu}" var="bus">--%>
                    <%--<option value="${bus.userId}">${bus.cname}</option>--%>
                <%--</c:forEach>--%>
            </select>
        </div> 
        <div class="right"> 
            <span>状态</span> 
            <input type="text" readonly value="已挂号">
            <input type="hidden" name="status" value="1">
        </div>
        <div id="error"></div> 
        <div class="buttons"> 
            <input type="submit" style="margin-top: 20px;margin-left: -160px" value="提交">
            <%--<input type="button" onclick="history.back()" value="返回"> --%>
        </div>
        <div id="information" style="margin-left: 75px;margin-top: 40px"></div>
    </div> 
</form> 
</body> 
</html> 
 
