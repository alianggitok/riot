webpackJsonp([1,2],{

/***/ 7:
/***/ function(module, exports, __webpack_require__) {

	/* WEBPACK VAR INJECTION */(function(riot) {(function () {

		riot.mount('demo1', {
			title: 'The First Riot Demo'
		});

		var demo2s = riot.mount('demo2'); //返回一个组件实例的数组
		demo2s[0].changeColor(); //可以调用实例内的方法、属性

		riot.mount('mixin');

		//events
		var events = riot.observable();
		events.pop = function (callback) {
			//创建事件
			alert('pops');
			callback();
		};
		riot.mount('event1', {
			events: events //传入事件对象，在标签中通过opts访问该事件对象
		});
	})();
	/* WEBPACK VAR INJECTION */}.call(exports, __webpack_require__(4)))

/***/ }

});