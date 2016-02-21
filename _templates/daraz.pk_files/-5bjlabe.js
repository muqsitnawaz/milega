try { 
	_weq['webengage.onReady'] = function() {
	function flatten(o, seperator, prefix, map) {
        var seenObjects = [];

        function flatten_(o, seperator, prefix, map) {
            map = map || {};
            prefix = prefix || "";
            //if root is array call individual elements on same map object and exit
            if (!prefix && o.constructor == Array) {
                for (var k = 0; k < o.length; k++) {
                    if(seenObjects.indexOf(o[k]) === -1) {
                        if (Object.prototype.toString.call(o[k]) === '[object Array]') {
                            seenObjects.push(o[k]);
                        }
                        flatten_(o[k], seperator, prefix, map);
                    }
                }
                return map;
            }
            for (var i in o) {
                if (!o[i] && o[i] !== 0) {
                    continue;
                }
                if (o.hasOwnProperty(i) && (isPrimitive(o[i]) || o[i].constructor == Array)) {
                    var key = prefix + seperator + i;
                    var value = o[i];
                    if (key.indexOf('.') > -1) {
                        key = key.replace(".", "_");
                    }
                    map[key.substring(1)] = value;
                }
            }
            return map;
        }

        return flatten_(o, seperator, prefix, map);
    }

    function isPrimitive(arg) {
        var type = typeof arg;
        return (type != "object" && type != "function");
    }

    var _weqDataLayer = flatten(typeof dataLayer !== 'object' ? {} : dataLayer, '-');
    _weq['webengage.ruleData'] = webengage.util.copy(_weq['webengage.ruleData'] || {}, _weqDataLayer, true);
    _weq['webengage.customData'] = webengage.util.copy(_weq['webengage.customData'] || {}, _weqDataLayer, true);
};  
 } catch(e) { 
 	if (e instanceof Error) { 
		var data = e.stack || e.description;
		data = (data.length > 900 ? data.substring(0, 900) : data);
	 	webengage.eLog(null, 'error', data, 'cwc-error','cwc', '~5bjlabe');
	 }
 }
