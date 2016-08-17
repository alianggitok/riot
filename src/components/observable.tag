<observable>
	<button onclick="{click('start')}" type="button">start</button>
	<button onclick="{click('stop')}" type="button">stop</button>
	<button onclick="{all('other')}" type="button">other</button>

	<script>
		var _tag=this;

		function Obser(){//创建一个事件侦听实例
			riot.observable(this);
			this.on('start stop',function(type){//在实例中注册事件，多个事件间用空格隔开
				alert(type+' done!');
			});
			this.on('*',function(type){//这样可以监听所有该实例上触发的事件
				alert(type+' done!');
			});
		}

		var obser=new Obser();

		_tag.click=function(type){
			return function(){
				obser.trigger(type);//触发事件
			};
		};

		_tag.all=function(type){
			return function(){
				obser.trigger(type);//触发事件
			};
		};

	</script>

</observable>

