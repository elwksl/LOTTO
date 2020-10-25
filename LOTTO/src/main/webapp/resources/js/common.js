var rxDatePattern = /^(\d{4})(\/|-)?(\d{2})(\/|-)?(\d{2})$/;

/*
 * java script prototype modify by creme55
 *
 */		
Number.prototype.format = function() {    
	if(this==0) return 0;     
	var reg = /(^[+-]?\d+)(\d{3})/;    
	var n = (this + '');     
	
	while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
	
	return n;
}; 

String.prototype.format = function() {    
	var num = parseFloat(this);    
	if( isNaN(num) ) return "0";     
	
	return num.format();
};

/*String.prototype.replaceAll = function( searchStr, replaceStr )
{
	return this.split( searchStr ).join( replaceStr );
}*/
/* ********************************************************************** */

(function($) {
	function exAjaxSetting(options) {
		var defaultOptions = {
			statusCheck : true,
			error : function(data) {
				alert('[' + data.status + '] ' + data.statusText);
			}
		};
		
		var settings = $.extend(true, defaultOptions, options || {});
		
		if($.isFunction(options.success)) {
			var optSuccess = options.success;
			settings.success = function(data) {
				if(settings.statusCheck) {
					if(data._status >= 0) {
						optSuccess.apply(this, [data]);
					} else {
						alert('[' + data._status + '] ' + data._message);
					}
				} else {
					optSuccess.apply(this, [data]);
				}
			};
		}
		return settings;
	}
	
	$.fn.exAjaxForm = function(options) {
		var settings = exAjaxSetting(options);
		return this.each(function() {
			$(this).ajaxForm(settings);
		});
	};
	
	$.fn.exAjaxSubmit = function(options) {
		var settings = exAjaxSetting(options);
		return this.each(function() {
			$(this).ajaxSubmit(settings);
		});
	};
	
	$.exAjax = function(options) {
		var settings = exAjaxSetting(options);
		$.ajax(settings);
	};
	
	 $.fn.customButton = function(settings) {
		 return this.each(function() {
			 var $this = $(this);
			 var text = $this.text();
			 $this.text('').append($('<span />').append($('<span />', {'text':text})));
		 });
	 };
	 
	 /* to use variable and global function to display at service main page */
	 
})(jQuery);

/*******************************************************************
function name : emailChk(email)
description : to check email
arguments : email
return : email
usage : emailChk(email)
********************************************************************/
function emailChk(email) {
	return /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i.test(email);
}

/*******************************************************************
function name : checkSpace(str)
description : to check blank(whitespace) 
argument : str
return : boolean
usage : checkSpace(str)
********************************************************************/
function checkSpace(str) {
	if (str.search(/\s/) != -1) {
		return true;
	} else {
		return false;
	}
}

/*******************************************************************
function name : isHangul(s)
description : to check hangul
argument : s
return : boolean
usage : isHangul(s)
********************************************************************/
function isHangul(s) {
	var len;
	len = s.length;
	for (var i = 0; i < len; i++) {
		if (s.charCodeAt(i) != 32 && (s.charCodeAt(i) < 44032 || s.charCodeAt(i) > 55203)) {
			return false;
		}
	}
	
	return true;
}

/*******************************************************************
function name : isValidDate(txtDate)
description : to check date's validation
argument : txtDate
return : boolean
usage : isValidDate(txtDate)
********************************************************************/
function isValidDate(txtDate) {
	var currVal = $.trim(txtDate);
	if(!currVal) {
		return false;
	}
  
	var dtArray = currVal.match(rxDatePattern);

	if (dtArray == null) {
		return false; 
	}
	
	var dtYear = dtArray[1];
	var dtMonth = dtArray[3];
	var dtDay= dtArray[5];

	if (dtMonth < 1 || dtMonth > 12)
		return false;
	else if (dtDay < 1 || dtDay > 31)
		return false;
	else if ((dtMonth==4 || dtMonth==6 || dtMonth==9 || dtMonth==11) && dtDay == 31)
		return false;
	else if (dtMonth == 2) {
		var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
		if (dtDay > 29 || (dtDay == 29 && !isleap))
			return false;
	}
	return true;
}

/*******************************************************************
function name : strToDateFormat(txtDate)
description : to return date's pattern
argument : txtDate
return : boolean
usage : strToDateFormat(txtDate)
********************************************************************/
function strToDateFormat(txtDate) {
	var currVal = $.trim(txtDate);
	if(!currVal) {
		return;
	}
  
	var dtArray = currVal.match(rxDatePattern);

	if (dtArray == null) {
		return; 
	}
	
	var dtYear = dtArray[1];
	var dtMonth = dtArray[3];
	var dtDay= dtArray[5];

	if (dtMonth < 1 || dtMonth > 12)
		return;
	else if (dtDay < 1 || dtDay > 31)
		return;
	else if ((dtMonth==4 || dtMonth==6 || dtMonth==9 || dtMonth==11) && dtDay == 31)
		return;
	else if (dtMonth == 2) {
		var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
		if (dtDay > 29 || (dtDay == 29 && !isleap))
			return;
	}
	return dtYear + '-' + dtMonth + '-' + dtDay;
}

/*******************************************************************
function name : stripDateFormat(txtDate)
description : to delete date delimiter then return the results
argument : txtDate
return : String
usage : stripDateFormat(txtDate)
********************************************************************/
function stripDateFormat(txtDate) {
	return txtDate.replace(/-/g, '');
}

/*******************************************************************
function name : xmlToString(xml)
description : to return xml string to convert xml string
argument : xml
return : String
usage : xmlToString(xml)
********************************************************************/
function xmlToString(xml) {
	if (window.ActiveXObject) { return xml.xml; }
	return new XMLSerializer().serializeToString(xml);
}

/*******************************************************************
function name : formatXml(xml)
description : to return xml
argument : xml
return : String
usage : formatXml(xml)
********************************************************************/
function formatXml(xml) {
	if(jQuery.type(xml) === 'object') {
		xml = xmlToString(xml);
	} else if(jQuery.type(xml) !== 'string') {
		return;
	}
	
	var formatted = '';
	var reg = /(>)(<)(\/*)/g;
	xml = xml.replace(reg, '$1\r\n$2$3');
	var pad = 0;
	jQuery.each(xml.split('\r\n'), function(index, node) {
		var indent = 0;
		if (node.match(/.+<\/\w[^>]*>$/)) {
			indent = 0;
		} else if (node.match(/^<\/\w/)) {
			if (pad != 0) {
				pad -= 1;
			}
		} else if (node.match(/^<\w[^>]*[^\/]>.*$/)) {
			indent = 1;
		} else {
			indent = 0;
		}

		var padding = '';
		for (var i = 0; i < pad; i++) {
			padding += '\t';
		}

		formatted += padding + node + '\r\n';
		pad += indent;
	});

	return formatted;
}

String.prototype.encodeHTML = function() {
	return this.replace(/&/g, '&amp;')
   .replace(/</g, '&lt;')
   .replace(/>/g, '&gt;')
   .replace(/"/g, '&quot;')
   .replace(/'/g, '&apos;');
};

String.prototype.decodeHTML = function() {
	return this.replace(/&apos;/g, "'")
				.replace(/&quot;/g, '"')
	            .replace(/&gt;/g, '>')
	            .replace(/&lt;/g, '<')
	            .replace(/&amp;/g, '&');
};

/**************************************************
function name : getCurrDate(dispTp)
description : to return the current date information
argument : dispTp 
return : String
usage : getCurrDate(dispTp)
***************************************************/
function getCurrDate(dispTp) {
	var newDate = new Date();
	var year = newDate.getFullYear();
	var month = newDate.getMonth() + 1;
	var day = newDate.getDate();
	var curr_hour = newDate.getHours();
	var curr_min = newDate.getMinutes();
	var curr_sec = newDate.getSeconds();
	var week = new Array('��', '��', '��', '��', '紐�', '湲�', '��');
	var todayMesg = "";
	
	month = (String(month).length == 1) ? "0" + month : month;
	day = (String(day).length == 1) ? "0" + day : day;
	
	curr_hour = (String(curr_hour).length == 1) ? "0" + curr_hour : curr_hour;
	curr_min = (String(curr_min).length == 1) ? "0" + curr_min : curr_min;
	curr_sec = (String(curr_sec).length == 1) ? "0" + curr_sec : curr_sec;
	
	if (dispTp == 1) {
		todayMesg = year + "�� " + month + "�� " + day + "�� " + curr_hour + ":" + curr_min + ":" + curr_sec;
	} else if (dispTp == 2) {
		todayMesg = year + "/" + month + "/" + day + " (" + week[newDate.getDay()] + ") " + curr_hour + ":" + curr_min + ":" + curr_sec;
	} else {
		var todayMesg = curr_hour + ":" + curr_min + ":" + curr_sec;
	}
	
	return todayMesg;
}

/**************************************************
function name : fn_firstAlphabet(str)
description : to check to exist alphabet in string
argument : str 
return : retVal
usage : fn_firstAlphabet(str)
***************************************************/
function fn_firstAlphabet(str) {
	var cmpStr = new RegExp(/^[a-zA-Z]+$/);
	var retVal = 0;
	
	if (cmpStr.test(str)) {
		retVal = 1;
	} else {
		retVal = 0;
	}
	
	return retVal;
}

/**************************************************
function name : fn_isNumber(str)
description : to check first character in string
argument : str 
return : retVal
usage : fn_isNumber(str)
***************************************************/
function fn_isNumber(str) {
	var cmpStr = new RegExp(/^[0-9]+$/);
	var retVal = 0;

	if (cmpStr.test(str)) {
		retVal = 1;
	} else {
		retVal = 0;
	}
	
	return retVal;
}

/*******************************************************************
function name : fn_checkDupChar(str, limit)
description : to check duplicate character in string
argument : str, limit
return : retVal
usage : fn_checkDupChar(str, limit)
********************************************************************/
function fn_checkDupChar(str, limit) { 
 
	var o, d, p, n = 0, l = (limit == null) ? 4 : limit; 
	 
	for(var i = 0; i < str.length; i++) { 
	 
		var c = str.charCodeAt(i); 
		 
		if(i > 0 && (p = o - c) > -2 && p < 2 && (n = p == d ? n + 1 : 0) > l - 3) return false; 
		 
		d = p, o = c; 
	} 
	 
	return true; 
}

/*******************************************************************
function : fn_hangulCheck(str)
description : to check hangul in string
argument : str
return : boolean
usage : fn_hangulCheck(str)
********************************************************************/
function fn_hangulCheck(str) {
	var pattern = new RegExp(/^[a-zA-Z0-9]+$/);
	
	if (str == "") return true;

	return pattern.test(str);
 
}