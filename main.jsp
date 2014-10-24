<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>疾控中心OA</title>
    <link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="themes/icon.css">
	<link rel="stylesheet" type="text/css" href="static/css/demo.css">
	<link rel="stylesheet" type="text/css" href="static/css/main.css">
	<script type="text/javascript" src="static/js/jquery.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.easyui.min.js"></script>
<style type="text/css">
	
	
	ul li{
		/*margin-top: 15;*/
		cursor: pointer;
	}
	
</style>

<script type="text/javascript">
	/*
	* view(url) 在layout中打开页面
	*/
	function view(url){
		$('#iframe').attr('src',url);
	}
	
	/*
	*添加选项卡方法
	*/
	function addTab(title,url){
		//先判断是否存在标题为title的选项卡
		var tab=$('#tt').tabs('exists',title);
		if(tab){
			//若存在，则直接打开
			$('#tt').tabs('select',title);
		}else{
			//否则创建
			$('#tt').tabs('add',{
				title:title,
				content:"<iframe width='100%' height='100%'  id='iframe' frameborder='0' scrolling='auto'  src='"+url+"'></iframe>",
				closable:true
			});
		}
		
	}
	
	/*
	*根据title,选中Accordion对应的面板
	*/
	function selectAccordion(title){
		$('#accordionPanel').accordion('select',title);
	}
	
	
	/*
	*刷新时间
	*/
	function showTime(){
		var date=new Date();
		
		$('#timeInfo').html();
		var user = ''
		if(username == 'admin'){
			user= username+'[管理员]';
		}else{
			user= username;
		}
		$('#timeInfo').html('欢迎你，'+user+'&nbsp;&nbsp;&nbsp;&nbsp;'+date.toLocaleString()+"&nbsp;&nbsp;");
	}
	setInterval(showTime,1000);
	
	/*
	*检测浏览器窗口大小改变,来改变页面layout大小
	*/
	$(function(){
		$(window).resize(function(){
			$('#cc').layout('resize');
		});
		
		
		$('.easyui-tree').tree({
			onClick: function(node){
				
				addTab(node.text,node.id);
			}
		});
		 username = '<%=request.getParameter("username") %>';
		 
		 
		 if(username == 'admin'){
			 $('#accordion_xtsz').css('display','block');
			 $('#a').css('display','block');
			  $('#b').css('display','block');
			   $('#c').css('display','block');
			   
		}else{
		
			$('#accordion_xtsz').css('display','none');
			$('#a').css('display','none');
			$('#b').css('display','none');
			$('#c').css('display','none');
			
			
			
		}
		 
		
		
		
		
	});
	
	
	
</script>


</head>
<body style="" onload="showTime();">
	
	
	<div id="cc" class="easyui-layout" style="width:100%;height:100%;">
		<!-- 页面顶部top及菜单栏 -->  
	    <div region="north" style="width: 100%;">
	    	<div class="header">
				<div style="text-align:right;padding-right: 20px;padding-top: 20px;">
					<span style="color:#ddd" id="timeInfo"></span>
					<a href="login.html" style="color:#fff;text-decoration:none;">退出</a>
				</div>
				<div class="maintitle" style="top: 10;">疾控中心OA</div>
			</div>
	    	
	    </div>  
	    <!-- 页面底部信息 -->
	    <div region="south" style="height: 35px;" >
	    	<center>
	    		<span>联系我们　 |　 法律声明　 |　合作伙伴　|　客户服务　|　隐私声明</span><br>
	    		<span>11 </span>
	    	</center>
	    </div>  
		<!-- 左侧导航菜单 -->	    
	    <div region="west"  title="导航菜单栏" style="width:180px;">
			<div class="easyui-accordion" fit="true" style="text-align: center;" id="accordionPanel">
				
				<div title="考勤" data-options="iconCls:'icon-ok'" >
					<!--<ul>
						<li onclick="javascript:addTab('实时考勤','booklist.jsp');">实时考勤</li>
						<li onclick="javascript:addTab('导入考勤','booklist.jsp');">导入考勤</li>
						<li onclick="javascript:addTab('月度汇总','ydhz.html');">月度汇总</li>
						<li onclick="javascript:addTab('员工请假统计','booklist.jsp');">员工请假统计</li>
					</ul>-->
					
					<ul id="tree" class="easyui-tree">
                       
					    <li id='sskq.html'>实时考勤</li>
						<li id='1' >导入考勤</li>
						<li  id='ydhz.html' >月度汇总</li>
						<li id='ygqjtj.html'>员工请假统计</li>
                           
                    </ul>
					
				</div>
				
					<div title="系统设置"  data-options="iconCls:'icon-ok'" >
						<ul>
							<li id='accordion_xtsz' onclick="javascript:addTab('权限设置','qxsz.html');">权限设置</li>
							<li id='a' onclick="javascript:addTab('部门考勤时间设置','bmsjsz.html');">部门考勤时间设置</li>
							<li id='b' onclick="javascript:addTab('员工考情类别设置','booklist.jsp');">员工考情类别设置</li>
							<li id='c' onclick="javascript:addTab('特殊人员设置','booklist.jsp');">特殊人员设置</li>
						</ul>
						
						
					<!--	
					<ul id="tree" class="easyui-tree">
                       
					    <li id='qxsz.html' >权限设置</li>
						<li id='bmsjsz.html' >部门考勤时间设置</li>
						<li   >员工考情类别设置</li>
						<li >特殊人员设置</li>
                           
                    </ul>-->
					</div>
				
				
				
			</div>	   
	    </div>  
	   
	    <!-- 主显示区域选项卡界面 title="主显示区域"-->
	    <div region="center">
	    	<div class="easyui-tabs" fit="true" id="tt"> 
	    		<div title="主页">
	    			<!--<iframe width='100%' height='100%'  id='iframe' frameborder='0' scrolling='auto'  src='ydhz.html'></iframe>-->
	    		</div>
	    	</div>
	    </div>  
	</div>
</body>
</html>