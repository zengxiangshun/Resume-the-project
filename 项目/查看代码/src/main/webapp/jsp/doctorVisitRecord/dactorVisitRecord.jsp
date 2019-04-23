<%--
  Created by IntelliJ IDEA.
  User: 16682
  Date: 2018/12/27
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/common.jsp"%>
<html>
<head>
    <title>Title</title>
    <style>

        div {border: 1px solid #000;margin:5px;}

        #page_container {
            border: 0px;
            width:95%;
            margin:0 auto;
            text-align:left;
        }
        #banner {
            height:70px;
            overflow-y: auto;
        }
        #left {
            width:13%;
            height:559px;
            float:left;
            overflow-y: auto;
        }
        #center {
            width:55%;
            height:309px;
            float:left;
            overflow-y: auto;
        }

        #right {
            float:right;
            width:29%;
            height:309px;
            overflow-y: auto;
        }
        #right2 {
            float:right;
            width:29%;
            height:130px;
        }
        #bottom {
            width:55%;
            height:238px;
            float:left;
            overflow-y: auto;
        }
        #btns{
            width: 17%;
            height: 70px;
            margin-top: 23px;
            margin-left: 75px;
            font-size: 40px;
        }
        .t{
            margin-right: 60px;
        }
    </style>
    <script>
        $(function () {
            $(".prsp").click(function () {
                $(".prsp").css("background-color","");
                $(this).css("background-color","red");
                var id = $(this).attr("name");
                id = id.split(",")[0];
                var $update = $("#Details");
                $.get("${path}/doctorVisitRecord/ajaxload.action",{id:id},function (data) {
                    $update.html("");
                    var $2 = $("<span>日期：<span style='color: red'>"+data.birth+"</span></span><br><br>");
                    $update.append($2);
                    var $3 = $("<span>性别：<span style='color: red'>"+data.sex+"</span></span><br><br>");
                    $update.append($3);
                    var $4 = $("<span>地址：<span style='color: red'>"+data.address+"</span></span><br><br>");
                    $update.append($4);
                    var $5 = $("<span>电话：<span style='color: red'>"+data.phonenum+"</span></span><br><br>");
                    $update.append($5);
                    var $6 = $("<span>身份证号：<span style='color: red'>"+data.personid+"</span></span><br><br>");
                    $update.append($6);
                },"json")

            })
            $(".nflag").click(function () {
                var prop = $(this).parent().attr("name");
                $.get("${path}/doctorMenuMedicine/ajaxxl.action",{a:prop},function (data) {
                    var $tradd = $("#tradd");
                    $tradd.children("tr").remove();
                    $(data).each(function () {
                        if (this.msamt==null || this.msamt==""){
                            var $2 = $("<tr class='trc' name='"+this.cid+"'><td>"+this.cname+"</td>" +
                                "<td>"+0+"</td>" +
                                "<td><input value='"+0+"' class='nubemflag' name='"+0+"' type='number' style='width: 50px'></td>" +
                                "<td><img src='${path}/images/del.gif' class='delete'></td></tr>");
                            $tradd.append($2);
                        }else {
                            if (this.msamt>this.amt){
                                var $2 = $("<tr class='trc' name='"+this.cid+"'><td>"+this.cname+"</td>" +
                                    "<td>"+this.msamt+"</td>" +
                                    "<td><input value='"+this.amt+"' class='nubemflag' name='"+this.msamt+"' type='number' style='width: 50px'></td>" +
                                    "<td><img src='${path}/images/del.gif' class='delete'></td></tr>");
                                $tradd.append($2);
                            }else {
                                var $2 = $("<tr class='trc' name='"+this.cid+"'><td>"+this.cname+"</td>" +
                                    "<td>"+this.msamt+"</td>" +
                                    "<td><input value='"+this.msamt+"' class='nubemflag' name='"+this.msamt+"' type='number' style='width: 50px'></td>" +
                                    "<td><img src='${path}/images/del.gif' class='delete'></td></tr>");
                                $tradd.append($2);
                            }

                        }

                    })
                },"json")
            })
            $("#tradd").on("keyup",".nubemflag",function () {
                var attr = $(this).attr("name");
                var val = $(this).val();
                if (parseInt(attr)<parseInt(val)){
                    alert("数量不可以大于库存")
                    $(this).val(attr);
                }
                if(val<0){
                    $(this).val(0);
                    $(this).parent().parent().remove();
                }
            })
            $("#tradd").on("change",".nubemflag",function () {
                var attr = $(this).attr("name");
                var val = $(this).val();
                if (parseInt(attr)<parseInt(val)){
                    alert("数量不可以大于库存")
                    $(this).val(attr);
                }
                if(val<0){
                    $(this).val(0);
                    $(this).parent().parent().remove();
                }
            })
            $("#tradd").on("click",".delete",function () {
               $(this).parent().parent().remove();
            })
            $("#butadds").click(function () {
                var a = $("#seladds").val();
                $.get("${path}/doctorVisitRecord/ajaxadd.action",{id:a},function (data) {
                    var $tradd = $("#tradd");
                    if (data.amt==null || data.amt==""){
                        var $2 = $("<tr class='trc' name='"+data.codeId+"'><td>"+data.medicineName+"</td>" +
                            "<td>"+0+"</td>" +
                            "<td><input value='"+0+"' class='nubemflag' name='"+0+"' type='number' style='width: 50px'></td>" +
                            "<td><img src='${path}/images/del.gif' class='delete'></td></tr>");
                        $tradd.append($2);
                    }else {
                        var $2 = $("<tr class='trc' name='"+data.codeId+"'><td>"+data.medicineName+"</td>" +
                            "<td>"+data.amt+"</td>" +
                            "<td><input value='' class='nubemflag' name='"+data.amt+"' type='number' style='width: 50px'></td>" +
                            "<td><img src='${path}/images/del.gif' class='delete'></td></tr>");
                        $tradd.append($2);
                    }

                },"json")
            })
            //提交
            $("#btns").click(function () {
                var flag = false;
                var cid = [];
                var attr2;
                $(".prsp").each(function () {
                    var attr = $(this).attr("style");
                   var split = attr.split(";");
                   if (split.length-1==4){
                        flag = false;
                        //获取用户id和用户挂号id
                        attr2 = $(this).attr("name");
                        $(".trc").each(function () {
                            //获取药品id
                            var attr3 = $(this).attr("name");
                            //药品数量
                            var val = $(this).children().children(".nubemflag").val();
                            if (val!=""&&val!=0){
                                var cad = attr3+","+val;
                                cid.push(cad)
                            }
                        })
                        return false;
                   }else {
                       flag=true;
                   }
                })
                if (flag){
                    alert("请选择病人")
                }else if(cid==null||cid.length==0){
                    alert("药品不能为空")
                }else {
//                    alert(attr2)
//                    alert(cid)
                    var symptom = $("#symptom").val();
                    var advice = $("#advice").val();
                    location.href="${path}/doctorVisitRecord/adda.action?a="+attr2+"&b="+cid+"&symptom="+symptom+"&advice="+advice;
                }
            })


        })
    </script>
</head>
<body class="main">
<div id="page_container">
    <div id="banner" style="font-size: 45px;text-align: center">医生就诊</div>
    <div id="left">
        <div style="border: none;font-size: 30px;text-align: center;background-color: aqua">就诊病人</div>
        <hr>
        <div style="overflow-y: auto;border: none;">
            <c:forEach items="${pr}" var="prs">
                <div class="prsp" name="${prs.patientId},${prs.registerId}" style="border: none;font-size: 25px;text-align: center;">${prs.pname}</div>
            </c:forEach>
        </div>
    </div>
    <div id="center">
        <div id="Details" style="float: left;width: 50%;height: 99.6%;margin: 0px"></div>
        <div  style="float: right;width: 49.3%;height: 99.6%;margin: 0px">
            <p style="margin-left:120px;font-weight: bold;font-size: 16px">症状</p>
            <textarea id="symptom" cols="49" rows="6" maxlength="100"></textarea>
            <p style="margin-left:120px;font-weight: bold;font-size: 16px">医生建议</p>
            <textarea id="advice" cols="49" rows="6" maxlength="100"></textarea>
        </div>
    </div>
    <div id="right">
        <table id="tradd" style="margin-left: 10px">
            <thead>
            <td>药品名</td>
            <td>库存数量</td>
            <td>药品数量</td>
            <%--<td><input type="number" style="width: 50px"></td>--%>
            <td>删除</td>
            </thead>

        </table>
    </div>
    <div id="right2">
        <div style="border: none;font-size: 20px;font-weight: bold;text-align: center">药品添加</div>
        <div></div>
        <%--药品--%>
        <select id="seladds">
            <c:forEach items="${mc}" var="mcs">
                <option value="${mcs.codeId}">${mcs.medicineName}</option>
            </c:forEach>
        </select>
        <button id="butadds">添加药品</button>
    </div>
    <div id="bottom">
        <table style="margin-left: 10px">
            <thead>
            <td>序号</td>
            <td>套餐名称</td>
            <td>套餐描述</td>
            <td>选择套餐</td>
            </thead>
            <c:forEach items="${dm}" var="dms" varStatus="status">
            <tr>
                <td>${status.index+1}</td>
                <td>${dms.menuName}</td>
                <td>${dms.description}</td>
                <td name="${dms.menuId}"><input class="nflag" style="margin-left: 50px" type="radio" name="q"></td>
            </tr>
            </c:forEach>
        </table>
    </div>
    <button type="" id="btns"><span class="t">提</span><span class="j">交</span></button>
</div>
</body>
</html>
