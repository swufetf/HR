<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="edu.hebeu.entity.*" %>
<%@ page import="com.baomidou.mybatisplus.plugins.Page" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>HR医院 - 职称列表</title>
	<meta name="keywords" content="">
	<meta name="description" content="">

	<link rel="shortcut icon" href="favicon.ico">
	<link href="<%=path %>/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
	<link href="<%=path %>/css/font-awesome.css?v=4.4.0" rel="stylesheet">

	<!-- Data Tables -->
	<link href="<%=path %>/css/plugins/dataTables/dataTables.bootstrap.css"
		rel="stylesheet">
	<link href="<%=path %>/css/animate.css" rel="stylesheet">
	<link href="<%=path %>/css/style.css?v=4.1.0" rel="stylesheet">



	<!--医疗主题按钮自添加 Start-->
	<style type="text/css">
		.medilife-btn {
			display: inline-block;
			color: #ffffff;
			background-color: #006cff;
			height: 45px;
			padding: 0 55px 0 30px;
			line-height: 42px;
			font-size: 14px;
			min-width: 140px;
			border-radius: 0;
			font-weight: 700;
			position: relative;
			z-index: 1;
			-webkit-transition-duration: 500ms;
			transition-duration: 500ms; }
		.medilife-btn span {
			width: 40px;
			height: 45px;
			background-color: #081f3e;
			display: inline-block;
			position: absolute;
			top: -1px;
			right: -1px;
			font-size: 24px;
			color: #ffffff;
			font-weight: 500;
			-webkit-transition-duration: 500ms;
			transition-duration: 500ms; }
		.medilife-btn:hover, .medilife-btn:focus {
			background-color: #081f3e;
			color: #ffffff; }
		.medilife-btn:hover span, .medilife-btn:focus span {
			color: #ffffff;
			background-color: #006cff; }
		.medilife-btn.btn-2 {
			background-color: #081f3e;
			color: #ffffff; }
		.medilife-btn.btn-2 span {
			color: #ffffff;
			background-color: #006cff; }
		.medilife-btn.btn-2:hover, .medilife-btn.btn-2:focus {
			background-color: #006cff;
			color: #ffffff; }
		.medilife-btn.btn-2:hover span, .medilife-btn.btn-2:focus span {
			color: #ffffff;
			background-color: #081f3e; }
		.medilife-btn.btn-3 {
			background-color: #ffffff;
			color: #081f3e;
			border: 2px solid;
			border-color: #006cff; }
		.medilife-btn.btn-3 span {
			top: -2px;
			right: -2px; }
		.medilife-btn.btn-4 {
			background-color: #ffffff;
			color: #081f3e;
			border: 2px solid;
			border-color: #006cff; }
		.medilife-btn.btn-4 span {
			background-color: #006cff;
			top: -2px;
			right: -2px; }
	</style>
	<!--医疗主题按钮自添加 End-->

</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>职称列表</h5>
					</div>
					<div class="ibox-content">
						<div>
							<a href="<%=path %>/position/toAdd.do" class="btn medilife-btn">添加职称<span>+</span></a>
						</div>
						<table class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>序号</th>
									<th>职称号</th>
									<th>职称名称</th>
									<th>权限</th>
									<th width="240px">描述</th>
									<th>管理</th>
								</tr>
							</thead>
							<tbody>
							<%
								Page<Position> pe=(Page<Position>)request.getAttribute("page");
	                            if(null != pe && null != pe.getRecords() && pe.getRecords().size()>0){
	                            	List<Position> list = pe.getRecords();
	                            	int index=1;
	                            	for(Position position : list){
                            %>
								<tr class="gradeA">
									<td><%=index++ %></td>
									<td><%=position.getPositionNumber() %></td>
									<td><%=position.getName() %></td>
									<td><%=position.getLevel() %></td>
									<td><%=position.getNotes() %></td>
									<td><a href="<%=path %>/position/<%=position.getId() %>/toUpdate.do" class="btn btn-primary">修改</a>&nbsp;&nbsp;
										<a href="<%=path %>/position/<%=position.getId() %>/delete.do" class="btn btn-danger">删除</a></td>
								</tr>
							<%
                            		}
                           		 }
                             %>
							</tbody>
						</table>
						<div>
							<span style="float: left; padding: 5px">
								当前&nbsp;<span style="color: red;"><%=pe.getCurrent() %></span>&nbsp;/&nbsp;<b><%=pe.getPages() %></b>&nbsp;页&nbsp;&nbsp;
								总共&nbsp;<b><%=pe.getTotal() %></b>&nbsp;条</span>
							<nav aria-label="Page navigation" style="margin: 0 auto; width: 240px">
								<ul class="pagination" style="margin: 0;">
									<li>
										<a href="<%=path %>/position/listPage.do?pageNo=<%=pe.getCurrent()-1>1?pe.getCurrent()-1:1 %>"
											aria-label="Previous"> <span aria-hidden="true">前一页</span>
										</a>
									</li>
								<%
	 								for(int i=1;i<=pe.getPages();i++){
								%>
									<li><a href="<%=path %>/position/listPage.do?pageNo=<%=i%>"><%=i %></a></li>
								<%
	 								 }
								%>
									<li><a href="<%=path %>/position/listPage.do?pageNo=<%=pe.getCurrent()+1<pe.getPages()?pe.getCurrent()+1:pe.getPages() %>"
										aria-label="Next"> <span aria-hidden="true">后一页</span>
									</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 全局js -->
	<script src="<%=path %>/js/jquery.min.js?v=2.1.4"></script>
	<script src="<%=path %>/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="<%=path %>/js/plugins/jeditable/jquery.jeditable.js"></script>

	<!-- Data Tables -->
	<script src="<%=path %>/js/plugins/dataTables/jquery.dataTables.js"></script>
	<script src="<%=path %>/js/plugins/dataTables/dataTables.bootstrap.js"></script>

	<!-- 自定义js -->
	<script src="<%=path %>/js/content.js?v=1.0.0"></script>

</body>
</html>
