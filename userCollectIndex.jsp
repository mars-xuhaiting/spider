<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="/common/usertop.jsp" flush="true" />
<link rel="stylesheet" href="<%=path%>/css/layout.css" type="text/css" />
<div class="inputUrl hidden" data-text0="采集引擎" data-text1="新增采集信息"></div>
<div class="mars-tableArea">
	<ul class="mars-collect-line" id="collect-exchange">
		<li class="collect-active">基本设置</li>
		<li>字段抓取配置</li>
		<li>URL抓取配置</li>
	</ul>
	<a class="mars-search-btn mars-btn-add" href="<%=path%>/collect/userCollectList" style="position: absolute; right: 20px; top: 15px;"> 返回采集列表</a>
	<input type="hidden" id="taskId" value="${model.taskId}">
	<ul class="collect-area" id="collectStep1">
		<li class="collect-area-line"><label>采集URL地址：</label>
			<div class="collect-area-input">
				<textarea id="entryUrl" class="mars-text500 form-control"
					name="entryUrl" placeholder="入口地址：可以输入多个网址，多个时用换行符分隔，不能为空"
					datatip="URL地址" required="required" dataoptions="required:required">${model.entryUrl}</textarea>
			</div></li>
		<li class="collect-area-line"><label>数据源名称：</label>
			<div class="collect-area-input">
				<input id="datasourceName" class="mars-input300 form-control"
					name="datasourceName" placeholder="数据源名称" datatip="数据源名称"
					required="required" dataoptions="required:required" value="${model.datasourceName}" />
			</div></li>
			<li class="collect-area-line"><label>数据源类型：</label>
			<input type="hidden" id="datasourceTypesun" value="${model.datasourceType}">
			<div class="collect-area-input">
				<select id="datasourceType" >
				
				</select>
			</div></li>
		<li class="collect-area-line"><label>采集线程数：</label>
			<div class="collect-area-input">
				<input id="threadNumber" class="mars-input300 form-control" placeholder="线程数量"
					name="threadNumber" value="${model.threadNumber}" datatip="采集线程数" required="required" dataoptions="required:required,type:PositiveNum" />
			</div></li>
		<li class="collect-area-line"><label>采集深度：</label>
			<div class="collect-area-input">
				<input id="depth" class="mars-input300 form-control"
					placeholder="采集深度" name="depth" value="${model.depth}" datatip="采集深度"
					required="required" dataoptions="required:required,type:PositiveNum" />
			</div></li>
		<li class="collect-area-line"><label>页面字符集：</label>
			<div class="collect-area-input">
				<input id="pageCharset" class="mars-input300" placeholder="页面字符集"
					name="pageCharset" value="${model.pageCharset }" datatip="页面字符集"
					required="required" dataoptions="required:required" />
			</div></li>
		<li class="collect-area-line"><label>位置参数：</label>
			<div class="collect-area-input">
				<textarea id="entryUrlPositionParams"
					class="mars-text500" name="entryUrlPositionParams" 
					placeholder="入口地址为：www.xx.com/\${1}_xx_\${2}...,参数格式为：aa,bb,cc...,参数与参数之间用英文逗号(,)隔开,多组参数用换行符分隔；" datatip="位置参数" >${model.entryUrlPosition_params}</textarea>
			</div></li>
		<li class="collect-area-line"><label>区间参数：</label>
			<div class="collect-area-input">
				<textarea id="entryUrlRangeParams" class="mars-text500"
					name="entryUrlRangeParams"
					placeholder="入口地址为：www.xx.com/date=\${range_1}/\${range_2}...,参数格式	为：n-m，n-step-m...其中n、step、m必须为正整数，m必须大于n，n为起始边界，step为增长步长，m为终止边界,不设步长默认为1,两端为包含关系，例如 2-4的结果为：2、3、4，1-2-5结果为：1 3 5 "
					datatip="区间参数">${model.entryUrlRangeParams }</textarea>
			</div></li>
		<li class="collect-area-line"><label>列表参数：</label>
			<div class="collect-area-input">
				<textarea id="entryUrlListParams" class="mars-text500"
					name="entryUrlListParams"
					placeholder="入口地址为：www.xx.com/\${list}..,参数格式为：aa,bb,cc...,即参数与参数之间用英文逗号(,)隔开"
					datatip="列表参数" >${model.entryUrlListParams}</textarea>
			</div></li>
		<li class="collect-area-line"><label>数据源描述：</label>
			<div class="collect-area-input">
				<textarea id="dataSourceDescribe" class="mars-text500"
					placeholder="数据源描述" name="dataDescribe">${model.datasourceDescribe}</textarea>
			</div></li>
	</ul>
	<div class="collect-area mars-hidden">
		<table class="colleat-add-table" id="collect-table-list" border="0"
			cellspacing="0" cellpadding="0">
			<thead>
				<tr>
					<th width="10%">字段分析器</th>
					<th width="20%">抓取字段名称</th>
					<th width="20%">字段提取规则</th>
					<th width="20%">字段包含关键字</th>
					<th width="20%">字段过滤关键字</th>
					<th width="10%">操作</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<select class="contentAwareType">
							<option value="regex">regex</option>
							<option value="xpath">xpath</option>
						</select>
					</td>
					<td>
						<input class="fieldName" type="text" name="fieldName">
					</td>
					<td><input class="contentAwareRule" type="text"
						name="contentAwareRule"></td>
					<td><input class="contentContainKey" type="text"
						name="contentContainKey"></td>
					<td><input class="contentFilterKey" type="text"
						name="contentFilterKey"></td>
					<td class="mars-btn-r mars-tb-btn"><a class="colleat-tb-add"
						href="javascript:;">添加</a>|<a class="colleat-tb-del"
						href="javascript:;">删除</a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<ul class="collect-area mars-hidden">
<!-- 		<li class="collect-area-line"><label>URL分析器：</label>
			<div class="collect-area-input">
				<select class="analyze" id="analyze">
					<option value="regex">regex</option>
					<option value="xpath">xpath</option>
					<option value="css">css</option>
				</select>
			</div></li> -->
		<li class="collect-area-line"><label>URL识别表达式：</label>
			<div class="collect-area-input">
				<textarea id="urlListAwareRule" class="mars-text500"
					name="urlListAwareRule"
					placeholder="对应的url识别表达式，可同时输入多个表达式，用换行符隔开 ">${model.urlListAwareRule}</textarea>
			</div></li>
		<li class="collect-area-line"><label>URL关键字过滤：</label>
			<div class="collect-area-input">
				<textarea id="urlFilterRule" class="mars-text500"
					name="urlFilterRule" placeholder="当url包含该内容时不会加入到后续爬取队列，多个用换行符分隔">${model.urlFilterRule }</textarea>
			</div></li>
		<li class="collect-area-line"><label>URL包含关键字：</label>
			<div class="collect-area-input">
				<textarea id="urlContainRule" class="mars-text500"
					name="urlContainRule" placeholder="当url包含该内容时才会加入到后续爬取队列，多个用换行符分隔">${model.urlContainRule }</textarea>
			</div></li>
	</ul>
	<div class="collect-area-line">
		<div class="collect-area-input">
			<span class="saveCollect-btn" id="saveCollectInfo">保存</span>
		</div>
	</div>
</div>
</div>
</div>
</div>
<jsp:include page="/common/userbottom.jsp" flush="true" />
<script>
	$(function(){
		$.ajax({
			type:"get",
			async:false,
			url:SSlocalhostPaht+"/collect/getInterfaceCategory",
			success:function(data){			 
				var res = '';
				for(var i = 0 ; i < data.length ; i ++){
					res += '<option value="'+data[i].categoryName+'">'+data[i].categoryName+'</option>';
				}
				$("#datasourceType").html(res);
			}
		});  
		var datasourceTypesun=$("#datasourceTypesun").val();
		if(datasourceTypesun.length>2){
			$("#datasourceType").val(datasourceTypesun);//设置下拉框选择
		}
	});
	
	$("#saveCollectInfo").on("click",function(){
		if(submitCheck("#collectStep1")){
			var entryUrl = document.getElementById("entryUrl").value;
			var datasourceName = document.getElementById("datasourceName").value;
			var threadNumber = document.getElementById("threadNumber").value;
			var depth = document.getElementById("depth").value;
			var pageCharset = document.getElementById("pageCharset").value;
			var entryUrlPositionParams = document.getElementById("entryUrlPositionParams").value;
			var entryUrlRangeParams = document.getElementById("entryUrlRangeParams").value;
			var entryUrlListParams = document.getElementById("entryUrlListParams").value;
			var dataSourceDescribe = document.getElementById("dataSourceDescribe").value;
			var datasourceType = document.getElementById("datasourceType").value;
			
			//var analyze = document.getElementById("analyze").value;
			
			var urlListAwareRule = document.getElementById("urlListAwareRule").value;
			var urlFilterRule = document.getElementById("urlFilterRule").value;
			var urlContainRule = document.getElementById("urlContainRule").value;
/* 			var xpathUrlListAwareRu = "",regexUrlListAwareRu = "",cssUrlListAwareRu = "";
			if(analyze == "regex"){
				regexUrlListAwareRu = urlListAwareRule;
			}else if(analyze == "xpath"){
				xpathUrlListAwareRu = urlListAwareRule;
			}else{
				cssUrlListAwareRu = urlListAwareRule;
			} */
			var tr = $("#collect-table-list tbody tr");
			var cusJson = {},cusList = [];
			var contentAwareType,fieldName,contentAwareRule,contentContainKey,contentFilterKey;
			if(tr.length > 0){
				for(var i = 0 ; i < tr.length ; i++){
					contentAwareType = tr[i].getElementsByTagName("select")[0].value
					fieldName = tr[i].getElementsByTagName("input")[0].value;
					contentAwareRule = tr[i].getElementsByTagName("input")[1].value;
					contentContainKey = tr[i].getElementsByTagName("input")[2].value;
					contentFilterKey = tr[i].getElementsByTagName("input")[3].value;
					if(contentAwareRule == ""){
						$(".collect-area").eq(1).show().siblings(".collect-area").hide();
						$("#collect-exchange li").eq(1).addClass("collect-active").siblings("li").removeClass("collect-active");
						layer.msg("请将字段提取规则填写完整！");
						return false;
					}
					cusJson = {
						contentAwareType:contentAwareType,
						fieldName:fieldName,
						contentAwareRule:contentAwareRule,
						contentContainKey:contentContainKey,
						contentFilterKey:contentFilterKey
					};
					cusList.push(cusJson);
				}
			}
			var data = {
				entryUrl:entryUrl,
				datasourceName:datasourceName,
				threadNumber:threadNumber,
				depth:depth,
				pageCharset:pageCharset,
				entryUrlPositionParams:entryUrlPositionParams,
				entryUrlRangeParams:entryUrlRangeParams,
				entryUrlListParams:entryUrlListParams,
				dataSourceDescribe:dataSourceDescribe,
				datasourceType:datasourceType,
				
				urlListAwareRule:urlListAwareRule,
				
				/*regexUrlListAwareRu:regexUrlListAwareRu,
				xpathUrlListAwareRu:xpathUrlListAwareRu,
				cssUrlListAwareRu:cssUrlListAwareRu, */
				
				urlFilterRule:urlFilterRule,
				urlContainRule:urlContainRule,
				
				//list 数组
				cusList:JSON.stringify(cusList)
			};
			//console.log(data);
			
			$.post(SSlocalhostPaht+"/collect/optionContro",{data:data,taskid:$("#taskId").val()}, function(data) {
				if(data.bl){
					layer.alert(data.msg,function(){
						 window.location.href = SSlocalhostPaht+"/collect/userCollectList";
					});
				}								 
			});
		}
	});

	$(document).on("click", ".colleat-tb-add", function() {
		var html = $(this).parents("tr").clone();
		//console.log(html);
		$("#collect-table-list tbody").append(html);
		var length = $("#collect-table-list tbody tr").length;
		$("#collect-table-list tbody tr").eq(length - 1).find("input").val("");
	});
	$(document).on("click", ".colleat-tb-del", function() {
		var index = $(this).parents("tr").index();
		if (index != "0") {
			$(this).parents("tr").remove();
		} else {
			alert("请勿删除第一行！");
		}
	});

	$("#collect-exchange li").on("click",function() {
		var index = $(this).index();
		$(this).addClass("collect-active").siblings("li").removeClass("collect-active");
		$(".collect-area").eq(index).show().siblings(".collect-area") .hide();
	});
	$(function(){
		var taskId = $("#taskId").val();
		if(taskId!=""){
			$.ajax({
				type:"get",
				async:false,
				url:SSlocalhostPaht+"/collect/getListAwaraInfoByTaskid?"+ + new Date().getTime(),
				data:{
					taskId:taskId
				},
				success:function(data){
					//console.log(data);
					var html="";
					for(var i = 0;i<data.length;i++){
						html += '<tr>';
						html += '<td>';
						html += '<select class="contentAwareType" data-value="'+data[i].contentAwareType+'">';
						html += '<option value="regex">regex</option>';
						html += '<option value="xpath">xpath</option>';
						//$(".contentAwareType").eq(i).find('option[value="'+data[i].contentAwareType+'"]').attr("selected",true);
						/* if(data[i].contentAwareType=="regex"){
							html += '<option value="regex" selected=ture>regex</option>';
							html += '<option value="xpath">xpath</option>';
						}else if(data[i].contentAwareType=="xpath"){
							html += '<option value="regex">regex</option>';
							html += '<option value="xpath" selected>xpath</option>';
						} */
						html += '</select>';
						html += '</td>';
						html += '<td><input class="fieldName" type="text" name="fieldName" value="'+data[i].fieldName+'"></td>';
						html += '<td><input class="contentAwareRule" type="text" name="contentAwareRule" value="'+data[i].contentAwareRule+'"></td>';
						html += '<td><input class="contentContainKey" type="text" name="contentContainKey" value="'+data[i].contentContainKey+'"></td>';
						html += '<td><input class="contentFilterKey" type="text" name="contentFilterKey" value="'+data[i].contentFilterKey+'"></td>';
						html += '<td class="mars-btn-r mars-tb-btn">';
						html += '<a class="colleat-tb-add" href="javascript:;">添加</a>|';
						html += '<a class="colleat-tb-del" href="javascript:;">删除</a>';
						html += '</td>';
						html += '</tr>';
					}
					$("#collect-table-list tbody").html(html);
					var contentAwareType = "";
					for(var j = 0;j<$(".contentAwareType").length;j++){
						contentAwareType = $(".contentAwareType").eq(j).attr("data-value");
						$(".contentAwareType").eq(j).find('option[value="'+contentAwareType+'"]').attr("selected",true);
					}
				}
			});  
		}
	});

</script>
</body>
</html>