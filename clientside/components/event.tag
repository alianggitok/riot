<event1>
	<button onclick="{click}" type="button">click here</button>

	<script>
		var _tag=this,
			events=_tag.opts.events;

		_tag.click=function(){
			events.pop(function(){//调用全局事件or方法（写在render.js文件中）
				alert('do somthing');
				events.trigger('pop2');//触发事件
			});
		};

		events.on('pop2',function(){//手动注册新事件
			alert('event done');
		});

	</script>

</event1>


<observable>
	<button onclick="{click('start')}" type="button">start</button>
	<button onclick="{click('stop')}" type="button">stop</button>
	<button onclick="{click('other')}" type="button">other</button>
	<button onclick="{click('beOff')}" type="button">this event is deleted</button>

	<script>
		var _tag=this;

		function Obser(){//创建一个事件侦听实例
			riot.observable(this);
			this.on('start stop beOff',function(type){//在实例中注册事件，多个事件间用空格隔开
				alert(type+' done!');
			});
			this.on('*',function(type){//这样可以监听所有该实例上触发的事件
				alert(type+' done!');
			});
		}

		var obser=new Obser();

		obser.off('beOff',function(){
			alert('off')
		});

		_tag.click=function(type){
			return function(){
				obser.trigger(type);//触发事件
			};
		};

	</script>

</observable>


