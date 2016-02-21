try { 
	_weq['webengage.notification.enableCallbacks'] = true;
_weq['webengage.notification.onOpen'] = function(notification){

var iframe = $weJQuery("#webklipper-publisher-widget-container-notification-frame");
iframe.css({
  'z-index' : '2'
});

//Shifting Desktop notification to center on Desktop
if( notification. notificationId == '3175c2b7' || notification. notificationId == '3175c345'){
  iframe.css({
    'width' : '100%',
      'z-index' : 100000
  });
}

};

 } catch(e) { 
 	if (e instanceof Error) { 
		var data = e.stack || e.description;
		data = (data.length > 900 ? data.substring(0, 900) : data);
	 	webengage.eLog(null, 'error', data, 'cwc-error','cwc', 'd8h612h');
	 }
 }
