<%--
  Created by IntelliJ IDEA. 
  2019/01/15 
  To change this template use File | Settings | File Templates. 
--%> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@include file="/common/common.jsp"%> 
<html> 
<head> 
    <script type="text/javascript"> 
        $(function () {
            var aa = 0;
            $("#addBtn").click(function () { 
                <%--location.href="${path}/jsp/inPatient/add.jsp";--%>
                var a = "";
                $(".chs").each(function () {
                    var prop = $(this).prop("checked");
                    if(prop){
                        var prop2 = $(this).prop("name");
                        a=a+prop2+",";
                    }
                })
                location.href="${path}/inPatient/upda.action?a="+a;
             })
            $(".update").click(function () { 
                var patientId = $(this).attr("name");
                location.href="${path}/inPatient/load.action?patientId="+patientId;
             })
            $(".delete").click(function () { 
                var patientId = $(this).attr("name");
                location.href="${path}/inPatient/delete.action?patientId="+patientId;
             })
            $("#search").click(function () { 
                var patientName = $("#patientName").val();
                var status = $("#status").val();

                location.href = "${path}/inPatient/search.action?patientName="+patientName+"&status="+status;
             })
            $(".che").click(function () {
                var checked = $(".che").prop("checked");
                if (checked){
                    $(".chs").prop("checked",true)
                }
                if (!checked){
                    $(".chs").prop("checked",false)
                }
            })
            $("#yin").click(function () {
                $(".bg").each(function () {
                    var prop = $(this).children().prop("name");
                    var split = prop.split(",");
                    if (split[0]==2){
                        $(this).parent().css("display","none");
                    }
                })
            })
            $("#xian").click(function () {
                $(".bg").each(function () {
                    var prop = $(this).children().prop("name");
                    var split = prop.split(",");
                    if (split[0]==2){
                        $(this).parent().css("display","");
                    }
                })
            })
            var max = 0;
            $(".se").each(function () {
                var html = $(this).children().prop("name");
                if (parseInt(max)<parseInt(html)){
                    max=html;
                    aa = $(this).prop("id");
                }

            })
            $("#"+aa+"").parent().css("color","red")
            
            
            $(".sj").click(function () {
                location.href = "${path}/inPatient/xu.action";
            })
            var ht = "";
            var cun = 1;
//            $(".fl").each(function () {
//                cun++;
//                var html = $(this).children().prop("name");
//                if (ht==html){
////                    $(this).prop("rowspan",cun)
//                    $(this)
//                    $(this).parent().prev().children(".fl").prop("rowspan",cun);
//
//                }else{
//                    ht=html;
//                    cun=1;
//                }
//            })
            $("#he").click(function () {
                location.href = "${path}/inPatient/he.action";
            })
        })  
    </script> 
</head> 
<body class="main"> 
    <div class="search"> 
        <span> 
            病人姓名：<input type="text" id="patientName" value="${searchObject.patientName}">
            状态：<%--<input type="text" id="status" value="${searchObject.status}">--%>
            <select id="status">
                <c:if test="${searchObject.status==1}">
                    <option value="1">在院</option>
                    <option value="2">出院</option>
                </c:if>
                <c:if test="${searchObject.status==2}">
                    <option value="2">出院</option>
                    <option value="1">在院</option>
                </c:if>
                <c:if test="${searchObject.status==null}">
                <option value="2">出院</option>
                <option value="1">在院</option>
            </c:if>
            </select>
        </span> 
        <span> 
            <button id="search">查询</button> 
        </span> 
        <span> 
            <button id="addBtn">出院</button>
        </span>
        <span>
            <button id="yin">隐藏出院</button>
        </span>
        <span>
            <button id="xian">显示出院</button>
        </span>
        <span>
            <button id="he">合计</button>
        </span>
    </div> 
    <table> 
        <thead>
            <td><input type="checkbox" class="che"></td>
            <td>序号</td> 
            <td>病人姓名</td> 
            <td>性别</td> 
            <td class="sj">出生日期</td>
            <td>床号</td> 
            <td>消费金额</td> 
            <td>1:在院2:出院</td> 
            <td>编辑</td> 
            <td>删除</td> 
        </thead> 
        <c:forEach items="${list}" var="inPatient" varStatus="status"> 
            <tr>
                <td><input type="checkbox" class="chs" name="${inPatient.patientId}" ></td>
                <td>${status.index+1}</td> 
                <td>${inPatient.patientName}</td> 
                <td class="fl">
                    <input style="display: none;" name=" ${inPatient.sex}}">
                        ${inPatient.sex}
                </td>
                <td>${inPatient.birth}</td> 
                <td>${inPatient.bedNum}</td> 
                <td id="${inPatient.patientId}" class="se">
                    <input style="display: none;" name="${inPatient.amount}">
                        ${inPatient.amount}
                </td>
                <td class="bg"><%--${inPatient.status}--%>
                    <input style="display: none;" name="${inPatient.status},${inPatient.amount}">
                    <c:if test="${inPatient.status==1}">
                        在院
                    </c:if>
                    <c:if test="${inPatient.status==2}">
                        出院
                    </c:if>
                </td>
                <td><img src="${path}/images/edit.gif" class="update" name="${inPatient.patientId}"></td> 
                <td><img src="${path}/images/del.gif" class="delete" name="${inPatient.patientId}"></td> 
            </tr> 
        </c:forEach> 
    </table>
<p>3~8个月的儿童:${as1}</p>
<p>6~18个月的儿童:${as2}</p>
</body>
</html> 
