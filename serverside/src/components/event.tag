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


<event2>
	<button onclick="{click('start')}" type="button">start</button>
	<button onclick="{click('stop')}" type="button">stop</button>
	<button onclick="{click('once')}" type="button">once</button>
	<button onclick="{click('other')}" type="button">other</button>
	<button onclick="{click('event')}" type="button">{eventOffBtnTxt}</button>

	<script>
		var _tag=this;

		_tag.eventOffBtnTxt='click here to remove event2';

		function Obser(){//创建一个事件侦听实例
			riot.observable(this);
			this.on('start stop',function(type,params){//在实例中注册事件，多个事件间用空格隔开，并可自定义外部传入的参数。另外，事件的命名是支持命名空间形式的（"eventSpace.event1 eventSpace.event2 ..."）
				params=JSON.stringify(params);
				alert(type+' done!\nIt has some params: '+params);
			});
			this.one('once',function(){//该事件只会触发一次
			  alert('once');
			});
			//this.on('*',function(type){//这样可以监听所有该实例上触发的事件，但是最好不要与其他事件绑定方式混用，因为会出现重叠
			//	alert(type+' done!');
			//});
		}

		var obser=new Obser();

		function event1(){
			alert('event1');
		}
		function event2(){
			alert('event2');
			obser.off('event',event2);//注销事件
			_tag.eventOffBtnTxt='event2 was removed';
		}

		obser.on('event',event1);//实例外部注册事件
		obser.on('event',event2);

		_tag.click=function(type){
			return function(){
				obser.trigger(type,{//触发事件，可以传递参数
					a:1,
					b:2
				});
			};
		};

	</script>

</event2>
