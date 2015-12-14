"use strict";
define(function(require, exports, module) {
	var jquery = require("jquery");
	var ComAlert = require('semantic-comalert');
	
	// init ace-editor
	//require("source-code-pro");
	var ace = require("ace/ace");
	var editor = ace.edit("ace-editor");
	editor.setTheme("ace/theme/idle_fingers");
	editor.getSession().setMode("ace/mode/javascript");
	
	// reset
	$("#reset").on('click', function(){
		$.ajax({
			type : 'POST',
			url : base_url + 'code/pullCode',
			data : {'moduleName' : 'demoModele'},
			dataType : "json",
			success : function(data){
				if (data.code == 200) {
					editor.setValue(data.returnContent);
					// or session.setValue
				} else {
					ComAlert.alert(data.msg);
				}
			}
		});
	});
	
	$("#submit").on('click', function(){
		var code = editor.getSession().getValue();
		// or session.getValue
		console.log(code);
		
		$.ajax({
			type : 'POST',
			url : base_url + 'code/pushCode',
			data : {
				'moduleName' : 'demoModele',
				'code' : code
			},
			dataType : "json",
			success : function(data){
				if (data.code == 200) {
					ComAlert.alert('提交成功');
					// or session.setValue
				} else {
					ComAlert.alert(data.msg);
				}
			}
		});
	});
	
	// retset init
	$("#reset").click();
	
});
