<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head lang="zh-cn">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel='shortcut icon' type='image/x-icon' href='favicon.ico' />
        <title>仓库管理</title>
        <link href="<%=request.getContextPath()%>/statics/css/metro.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/statics/css/metro-icons.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/statics/css/metro-responsive.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/statics/css/metro-schemes.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/statics/css/font-awesome.min.css" rel="stylesheet" >
        <link href="<%=request.getContextPath()%>/statics/css/button.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/statics/css/docs.css" rel="stylesheet">

        <script src="<%=request.getContextPath()%>/statics/js/jquery-2.1.3.min.js"></script>
        <script src="<%=request.getContextPath()%>/statics/js/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/statics/js/metro.js"></script>
        <script src="<%=request.getContextPath()%>/statics/js/docs.js"></script>
        <script src="<%=request.getContextPath()%>/statics/js/prettify/run_prettify.js"></script>
        <script src="<%=request.getContextPath()%>/statics/js/ga.js"></script>
        <script src="<%=request.getContextPath()%>/statics/js/metro-utils.js"></script>
        <script src="<%=request.getContextPath()%>/statics/js/select2.min.js"></script>
</head>

<body bgcolor="#E7E3E8">
    <div class="container">
        <ul class="h-menu" >
            <li><a style="color:black">药品进库</a></li>
            <li><a href="#">药品进出库记录</a></li>
            <li><a href="<%=request.getContextPath()%>/index.jsp">药品库存</a></li>
            <li>
                <a href="#" class="dropdown-toggle">More...</a>
                <ul  class="d-menu" data-role="dropdown">
                    <li><a href="#">关于我们</a></li>
                    <li><a href="#">感谢</a></li>
                </ul>
            </li>
        </ul>
        <ul class="breadcrumbs">
            <li><a href="<%=request.getContextPath()%>/index.jsp"><span class="icon mif-home"></span></a></li>
            <li><a href="<%=request.getContextPath()%>/index.jsp">仓库管理</a></li>
            <li><a>药品进库</a></li>
        </ul><br/><br/>
        <div class="leader align-center" id="header">药品进库管理</div>
        <form id="mdedicalStoringForm"  style="padding-top:30px;">
            <div class="example" data-text="请填写：">
             <div class="grid">
                <div class="row cells2">
                    <div class="cell">
                        <label><span style="color:red">*</span>药品编号</label>
                        <div class="input-control text full-size" data-role="input">
                            <input type="text" id="approvalNumber">
                            <button class="button helper-button clear"><span class="mif-cross"></span></button>
                        </div>
                        <label><span style="color:red">*</span>药品名称</label>
                        <div class="input-control text full-size" data-role="input">
                            <input type="text" id="medicalName">
                            <button class="button helper-button clear"><span class="mif-cross"></span></button>
                        </div>
                        <label><span style="color:red">*</span>是否为处方药</label>
                        <select class="js-select full-size" id="isPrescription">
                                <option></option>
                                <option value="1">处方药</option>
                                <option value="0">非处方药</option>
                        </select>
                        <button style="margin-right:300px;" class="button button-glow button-border button-rounded button-primary submit">提交</button>
                    </div>
                    <div class="cell">
                        <label><span style="color:red">*</span>进价</label>
                        <div class="input-control text full-size" data-role="input">
                            <input type="text" id="inPrice">
                            <button class="button helper-button clear"><span class="mif-cross"></span></button>
                        </div>
                        <label><span style="color:red">*</span>数量</label>
                        <div class="input-control text full-size" data-role="input">
                            <input type="text" id="medicalNumber">
                            <button class="button helper-button clear"><span class="mif-cross"></span></button>
                        </div>
                        <label for="">存放位置</label>
                        <div class="input-control text full-size" data-role="input">
                            <input type="text" id="medicallocation">
                            <button class="button helper-button clear"><span class="mif-cross"></span></button>
                        </div>
                        <button style="margin-right:30px;" class="button button-border button-glow button-rounded button-royal reset ">重置</button>
                    </div>
                </div>
             </div>
            </div>
        </form>
        <button onclick="showDialog('#errormassage')">提示</button>
        <div data-role="dialog" id="errormassage" class="padding20" data-close-button="true" data-type="warning" data-width="45%">
            <h1>提示</h1>
            <p id="errorMassageContain">
            </p>
<!--             <div class="grid"> -->
<!--                 <div class="row cells4"> -->
<!--                     <div class="cell"></div> -->
<!--                     <div class="cell"></div> -->
<!--                     <div class="cell"> -->
<!--                      <button class="button button-glow button-border button-rounded button-plain button-small">确定</button></div> -->
<!--                     <div class="cell"> -->
<!--                      <button class="button button-glow button-border button-rounded button-plain button-small">取消</button></div> -->
<!--                 </div> -->
<!--             </div> -->
            </div>
        </div>
        <div data-role="dialog" id="message" class="padding20" data-close-button="true" data-width="45%">
            <h1>提示</h1>
            <p id="messageContain">
            </p>
		</div>
	</div>
    </div>
</body>
    
<!-- Dynamic page helper script -->
<script>var contextPath="<%=request.getContextPath()%>";</script>
<script>
        $(function(){
            $(".js-select").select2({
                placeholder: "请选择",
                allowClear: true
            });
        });
        function showDialog(id){
            var dialog = $(id).data('dialog');
            dialog.open();
        }
    function submitmedicalStorgForm()
    {
        if($("#approvalNumber").val() == "")
        {
            $("#errorMassageContain").html("请填写药品编号!");
            showDialog('#errormassage');
            return ;
        }
        if($("#medicalName").val() == "")
        {
            $("#errorMassageContain").html("请填写药品名!");
            showDialog('#errormassage');
            return ;
        }
        if($("#isPrescription").val() == "")
        {
            $("#errorMassageContain").html("请选择药品是否为处方药!");
            showDialog('#errormassage');
            return ;
        }
        if($("#inPrice").val() == "")
        {
            $("#errorMassageContain").html("请填写药品进价!");
            showDialog('#errormassage');
            return ;
        }
        if($("#inPrice").val() < "0")
        {
            $("#errorMassageContain").html("药品进价应该大于0!");
            showDialog('#errormassage');
            return ;
        }
        if($("#medicalNumber").val() == "")
        {
            $("#errorMassageContain").html("请填写药品进库量!");
            showDialog('#errormassage');
            return ;
        }
        if($("#medicalNumber").val() < "0")
        {
            $("#errorMassageContain").html("药品进库量应该大于0!");
            showDialog('#errormassage');
            return ;
        }
        if($("#medicallocation").val() == "")
        {
            $("#errorMassageContain").html("请填写药品存放位置!");
            showDialog('#errormassage');
            return ;
        }
        mdedicalStoringForm();
}
function mdedicalStoringForm(){
	var postData={
			approvalNumber : $("#approvalNumber").val(),
			medicalName : $("#medicalName").val(),
			isPrescription : $("#isPrescription").val(),
			inPrice : $("#inPrice").val(),
			medicalNumber : $("#medicalNumber").val(),
			medicallocation : $("#medicallocation").val()
	};
// 	$.ajax({
// 		"type" : "POST",
// 		"url" : contextPath + "/staff/homepageManage/announcementManage/unstick/" ,
// 		"contentType" : "application/json",
// 		"data" : JSON.stringify(postData),
// 		"dataType" : "json",
// 		"success" : function(data) {
// 			if (data.code == 1) {
// 				$("#messageContain").html("data.msg");
// 	            showDialog('#message');
// 			} else {
// 				$("#messageContain").html("Error:" + data.msg);
// 	            showDialog('#message');
// 			}
// 		},
// 		"error" : function() {
// 			$("#messageContain").html("error!");
//             showDialog('#message');
// 		},
// 		"complete" : function() {
// 		}
// 	});
	var url=""; 
	jQuery.post(url,data,success(data),dataType)
	
}
function success(data) {
		if (data.code == 1) {
			$("#messageContain").html("data.msg");
        showDialog('#message');
		} 
			if (data.code == 1) {
			$("#messageContain").html("data.msg");
        showDialog('#message');
		} else {
			$("#messageContain").html("Error:" + data.msg);
        showDialog('#message');
		}
}
$("#mdedicalStoringForm").submit(function(){
    submitmedicalStorgForm();
    return false;
});

    </script>
</html>
