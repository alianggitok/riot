//这里的对象可以作为多个组件的共享对象
//作用域在tag内部
var shareData={
	data:{
		name:'mixin'
	},
	changeColor:function(){
		$(this.root).css({
			'color':'orange',
			'font-size':'1.5em'
		});
		console.log(this.opts.dataName,'changed');
	}
};

//还可以在标签外部这样把对象注册到全局，给整个应用共享：
riot.mixin('mixinData',{
	a:1,
	b:2
});

<demo1>
	<h2>{opts.title}</h2>
	<p>{msg}</p>
	<p>{data.name}</p>
	<ul>
		<li each={item,i in items}>{i+1}. {item.name}</li>
	</ul>

	<script>

		var _tag=this;
		_tag.mixin(shareData);//混入共享对象
		console.log(_tag,_tag.root,_tag.data.name);
		
		_tag.msg='Hello,riot!';
		_tag.items=[
			{id:'01',name:'html'},
			{id:'02',name:'script'},
			{id:'03',name:'style'}
		];

		//事件监听 befor-mount、mount、update、updated、before-unmount、unmount、all
		_tag.on('mount',function(){
			console.log('mounted',$('li',_tag.root).length);
		});
		_tag.on('update',function(){
			console.log('updated',$('li',_tag.root).length);
		});
	</script>

	<style scoped>
		:scope{font-size:2rem}
		h2{color:red}
		ul{color:#999}
	</style>

</demo1>


<demo2>
	<form id="form"  action="">
		<input name="name" type="text">
	</form>
	<yield/><!--<yield/>占位符，在html上，被标签包含的html在这里还原，渲染后是没有这个标签的-->
	<div name="name">{data.name}</div>
	<yield from="html"/><!--支持多点占位符，from、to属性-->
	<!-- 带id、name的元素可以直接被标签内的js访问到，并且可以嵌套，比如this.name、this.form.name -->
	<script>
		var _tag=this;
		_tag.mixin(shareData);//混入共享对象
		console.log(_tag.root,_tag.data.name,_tag.form.name)

		$(_tag.form.name).on('keyup change',function(){
			console.log(this.value);
		});
		
	</script>
	<style scoped>
		:scope{font-size:2rem;color:blue}
	</style>
</demo2>

<mixin>
	<p>mixinData: {a}, {b}</p>
	this.mixin('mixinData')
</mixin>
