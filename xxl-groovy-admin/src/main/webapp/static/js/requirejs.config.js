require.config({
	//baseUrl: '',	// 当前文件为根路径
	// 非AMD模块输出，将非标准的AMD模块"垫"成可用的模块
	shim: {
		'jquery.validate': ['jquery'],
		'semantic-ui-modal': ['semantic'],
		'semantic-ui-form': ['semantic'],
		'semantic-ui-transition': {deps: ['semantic'], exports: 'semantic-ui-transition' }
	},
    paths: {
        'jquery'					:	'../plugins/jquery/jquery.2.1.4.min',
        'jquery.validate'			: 	'../plugins/jquery/jquery.validate.1.13.1.min',
        'semantic'					:	'../plugins/semantic-ui/dist/semantic.min',
        'semantic-ui-modal' 		: 	'../plugins/semantic-ui/dist/components/modal',
        'semantic-ui-form' 			: 	'../plugins/semantic-ui/dist/components/form',
        'semantic-ui-transition' 	:	'../plugins/semantic-ui/dist/components/transition',
        'semantic-comalert'			:	'../js/semantic-comalert'
    }
});