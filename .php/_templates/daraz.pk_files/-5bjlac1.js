try { 
	_weq['webengage.enableCallbacks'] = true;
_weq['webengage.onReady'] = function () {
   // notificationId to be rendered even if it is closed or clicked
   var notificationId = '22a33c814';
   // show the notification even if the notification was closed
   _weq['webengage.notification.onClose'] = function (data) {
    if (data && data.notificationId === notificationId) {
        setTimeout(function () {
        var ss = webengage.util.getSessionCookie();
        ss['closedNIds'] = ss['closedNIds'] && ss['closedNIds'].replace("##"+notificationId, "");
        webengage.util.setSessionCookie(ss);
        }, 500);
    }
   };
   // show the notification even if the notification was clicked
   _weq['webengage.notification.onClick'] = function (data) {
    if (data && data.notificationId === notificationId) {
        var lts = webengage.util.getWebengageCookie();
        lts['takenNIds'] = lts['takenNIds'].replace("##"+notificationId, "");
        webengage.util.setWebengageCookie(lts);
    }
   };
};
 } catch(e) { 
 	if (e instanceof Error) { 
		var data = e.stack || e.description;
		data = (data.length > 900 ? data.substring(0, 900) : data);
	 	webengage.eLog(null, 'error', data, 'cwc-error','cwc', '~5bjlac1');
	 }
 }
