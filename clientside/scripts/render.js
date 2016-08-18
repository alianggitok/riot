(function(riot){
	
	var compilers={
		demo:function(){
			riot.mount('demo1',{
				title:'The First Riot Demo'
			});
			
			var demo2s=riot.mount('demo2');//返回一个组件实例的数组
			demo2s[0].changeColor();//可以调用实例内的方法、属性

			riot.mount('mixin');
		},
		event:function(){
			var events=riot.observable();//创建事件监听器实例
			events.pop=function(callback){//在相对全局创建一个事件方法
				alert('pops');
				callback();
			};

			riot.mount('event1',{
				events:events//将事件监听对象传入tag，在标签中通过opts访问该事件对象
			});
			riot.mount('event2');
			riot.mount('observable');
		}
	};

	riot.compile('../components/demo.tag',function(){//确保在载入tag文件，编译后执行回调，浏览器端的编译方式
		alert('"demo.tag" loaded!');
		compilers.demo();
	});
	riot.compile('../components/event.tag',function(){
		alert('"event.tag" loaded!');
		compilers.event();
	});

}(riot));