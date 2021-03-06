<%@page import="com.routon.plcloud.common.decorator.PageCheckboxDecorator"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net" %>
<%@ include file="/WEB-INF/views/head_n.jsp" %>
	<link rel="stylesheet" href="${ctx}/css/bootstrap-datetimepicker.css">
	<script src="${ctx}/js/bootstrap-datetimepicker.js"></script>
	<script src="${ctx}/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<p style="padding-top: 10px;"><strong>已授权清单：</strong></p>
	<div class="panel panel-default" style="width: 1560px;">
			<div class="panel-heading " style="padding: 0px;">
  			<div class="" style="display: inline-block;width: 100%;">
  			
	  			<div class=" col-sm-8" style="width: 1530px;">
		  			<form class="form-inline" role="form" id="queryform" name="queryform" action="${ctx}/terminal/setprofile.do"  method="post">  		
		  			<div class="btn-group" style="margin-top: 5px;margin-bottom: 5px;">
		  				<input size="20" type="text" id="hotelName" name="hotelName" value="${hotelName}" class="form-control" placeholder="请输入酒店名称">
		  			</div>
		  			<div class="btn-group" style="margin-top: 5px;margin-bottom: 5px;">
		  				<input size="20" type="text" id="hotelCode" name="hotelCode" value="${hotelCode}" class="form-control" placeholder="请输入酒店代码">
		  			</div>
		  			<div class="btn-group" style="margin-top: 5px;margin-bottom: 5px;">
			  			<div class="input-group date form_datetime">
						    <input size="20" type="text" id="startDate_createTime" name="startDate_createTime" value="${startDate_createTime}" class="form-control" readonly placeholder="请输入开始时间">
						    <span class="input-group-addon">
						    <span class="glyphicon glyphicon-calendar"></span>
						    </span>
						</div>
						
					</div>
					<div class="btn-group" style="margin-top: 5px;margin-bottom: 5px;">
			  			<div class="input-group date form_datetime">
						    <input size="20" type="text" id="endDate_createTime" name="endDate_createTime" value="${endDate_createTime}" class="form-control" readonly placeholder="请输入结束时间">
						    <span class="input-group-addon">
						    <span class="glyphicon glyphicon-calendar"></span>
						    </span>
						</div>
						
					</div>
					
		  			<div class="btn-group">
		  				<button id="queryBtn" type="submit" class="btn btn-primary" >查询</button>
		  			</div>
		  			<div class="btn-group">
		  				<button id="clearBtn" type="button" class="btn btn-primary" >清空</button>
		  			</div>
		  			</form>
	  			</div>
  			</div> 
  		</div>
		<display:table name="requestScope.pageList" id="curPage1" class="table table-striped" sort="external"
			requestURI=""
			decorator="com.routon.plcloud.common.decorator.PageDecorator"
			export="false">
				<display:column property="id" title="<%=PageCheckboxDecorator.getTitle(pageContext)%>" decorator="com.routon.plcloud.common.decorator.PageCheckboxDecorator"  style="width:2%;"/>
				<display:column title="酒店名称"  property="client_name"  sortable="true"  style="width:5%;"></display:column>
				<display:column title="酒店代码"  property="client_code" sortable="true"  style="width:10%;" maxLength="50"></display:column>
				<display:column title="设备码"  property="term_code"  sortable="true"  style="width:5%;"></display:column>
				<display:column title="授权成功时间"  property="time"  sortable="true"  style="width:5%;"></display:column>
		</display:table>
	</div>
	<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
	
	<p style="padding-top: 10px;"><strong>根据imei查询已授权终端数：</strong></p>
	<div class="panel panel-default" style="width: 780px;">
			<display:table name="requestScope.imeipage" id="curPage2" class="table table-striped" sort="external"
			requestURI=""
			decorator="com.routon.plcloud.common.decorator.PageDecorator"
			export="false">
				<display:column title="公司名称"  property="company_name" sortable="true"  style="width:10%;" maxLength="50"></display:column>
				<display:column title="项目"  property="project"  sortable="true"  style="width:5%;"></display:column>
				<display:column title="imei"  property="imei"  sortable="true"  style="width:5%;"></display:column>
			</display:table>
	</div>
	
	
<script>
$(".form_datetime").datetimepicker({
    format: "yyyy-mm-dd hh:ii:ss",
    autoclose: true,
    todayBtn: true,
   	clearBtn:true,
    language:'zh-CN',
    pickerPosition: "bottom-left"
});

$("#clearBtn").on("click", function() {
	$("#hotelName").val("");
	$("#hotelCode").val("");
	$("#startDate_createTime").val("");
	$("#endDate_createTime").val("");
});
</script>
<%@ include file="/WEB-INF/views/foot_n.jsp" %>