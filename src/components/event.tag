<event1>
	<button onclick="{click}" type="button">click here</button>

	<script>
		var _tag=this,
			events=_tag.opts.events;

		_tag.click=function(){
			events.pop(function(){//调用全局事件（方法）
				alert('do somthing');
				events.trigger('pop2');//触发事件
			});
		};

		events.on('pop2',function(){//手动注册新事件
			alert('event done');
		});
		
	</script>

</event1>

