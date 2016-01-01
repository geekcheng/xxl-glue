'use strict';
define(['jquery', 'semantic-comalert', 'moment', 'datatables-jquery'], function($, ComAlert, moment ) {
	
	// init date tables
	var codeTable = $("#code_list").dataTable({
		"deferRender": true,
		"processing" : true, 
	    "serverSide": true,
		"ajax": {
	        url: base_url + "/code/pageList" ,
	        data : function ( d ) {
                d.name = $('#codeName').val()
            }
	    },
	    "searching": false,
	    "ordering": true,
	    //"scrollX": true,  // X轴滚动条，强制性固定长度
	    "columns": [
	                { "data": 'id', "bSortable": false, "visible" : true},
	                { "data": 'name', "bSortable": false},
	                { "data": 'source', "bSortable": false},
	                { "data": 'remark', "bSortable": false},
	                { 
	                	"data": 'addTime', 
	                	"bSortable": false, 
	                	"render": function ( data, type, row ) {
	                		return data?moment(new Date(data)).format("YYYY-MM-DD HH:mm:ss"):"";
	                	}
	                },
	                { 
	                	"data": 'updateTime',
	                	"bSortable": false,
	                	"render": function ( data, type, row ) {
	                		return data?moment(new Date(data)).format("YYYY-MM-DD HH:mm:ss"):"";
	                	}
	                }
	            ],
        "columnDefs": [
                     {
                    	 "targets": 6,
                         "data": "id",
                         "render": function ( data, type, row ) {
                        	 $('#delCode_' + row.id).on('click', function(){
                        		 ComAlert.confirm("确定要进行删除记录，该操作不可恢复",
                    			     function(){
                    				 	$.ajax({
                    						type : 'POST',
                    						url : base_url + '/code/delCode',
                    						data : {
                    							id : row.id
                    						},
                    						dataType : "json",
                    						success : function(data){
                    							if (data.code == 200) {
                    								ComAlert.alert("删除成功", function(){
                    									codeTable.fnDraw();
                    		     					});
                    							} else {
                    								ComAlert.alert(data.msg);
                    							}
                    						}
                    					});
                    				}
                        	 	);
                        	 });
                        	 var editUrl = base_url + "code/codeEditor?id=" + row.id;
                        	 var html = '<button type="button" class="yellow ui tiny button" onclick="javascript:window.open(\''+editUrl+'\');">编辑</button>' + 
                             '<button type="button" class="red ui tiny button" id="delCode_'+ row.id +'" >删除</button>';
                             return html;
                         }
                     }
                 ],
		"language" : {
			"sProcessing" : "处理中...",
			"sLengthMenu" : "每页 _MENU_ 条记录",
			"sZeroRecords" : "没有匹配结果",
			"sInfo" : "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
			"sInfoEmpty" : "无记录",
			"sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
			"sInfoPostFix" : "",
			"sSearch" : "搜索:",
			"sUrl" : "",
			"sEmptyTable" : "表中数据为空",
			"sLoadingRecords" : "载入中...",
			"sInfoThousands" : ",",
			"oPaginate" : {
				"sFirst" : "首页",
				"sPrevious" : "上页",
				"sNext" : "下页",
				"sLast" : "末页"
			},
			"oAria" : {
				"sSortAscending" : ": 以升序排列此列",
				"sSortDescending" : ": 以降序排列此列"
			}
		}
	});
	
	// 搜索按钮
	$('#searchBtn').on('click', function(){
		codeTable.fnDraw();
	});
	 
    return '200';
});