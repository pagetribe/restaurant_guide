// JavaScript Document

sfHover = function() {
	var sfEls = document.getElementById("mainNav").getElementsByTagName("LI");
	for (var i=0; i<sfEls.length; i++) {
		sfEls[i].onmouseover=function() {
			this.className+=" sfhover";
		}
		sfEls[i].onmouseout=function() {
			this.className=this.className.replace(new RegExp(" sfhover\\b"), "");
		}
	}
}
if (window.attachEvent) window.attachEvent("onload", sfHover);


function ToggleDisplay(DivID) {
    var div = document.getElementById(DivID);
    if (div.style.display == "none") {
        div.style.display = "block";
        return true;
    } else {
        div.style.display = "none";
        return false;
    }
}


function PopUpLink(Url, Title, Width, Height) {
    window.open(Url, Title, 'menubar=0,resizeable=1,scrollbars=1,width=' + Width + ',height=' + Height);
}


function Trim(Value) {
    return Value.replace(/^\s+|\s+$/g, "");
}

function FormatCurrency(value, prefix, suffix) {
    value = value.toString();

    if (value.indexOf('.') > 0) {
        if (value.indexOf('.') != (value.length - 3)) {
            value = value + "0";
        }
    } else {
        value = value + ".00";
    }

    return prefix + value + suffix;
}


function GetParameterByName(strName) {
    var params = document.URL.split('?')[1].split('&');

    for (var i = 0; i < params.length; i++) {
        if (params[i].split('=')[0] == strName) {
            params = params[i].split('=')[1];
            break;
        }
    }

    return params;
}