/***********************************************

* DHTML Select Menu- by JavaScript Kit (www.javascriptkit.com)
* Menu interface credits: http://www.dynamicdrive.com/style/csslibrary/item/glossy-vertical-menu/ 
* This notice must stay intact for usage
* Visit JavaScript Kit at http://www.javascriptkit.com/ for this script and 100s more

***********************************************/

var combodropimage='/EntBooks/images/downbox.png' //path to "drop down" image
var combodropoffsetY=2 //offset of drop down menu vertically from default location (in px)
var combozindex=100

if (combodropimage!="")
	combodropimage='<img class="downimage" src="'+combodropimage+'" title="Select an option" />'

function dhtmlselect(selectid, selectwidth, optionwidth){
	var selectbox=document.getElementById(selectid)
	document.write('<div id="dhtml_'+selectid+'" class="dhtmlselect">'+selectbox.title+" "+combodropimage+'<div class="dropdown">')
	for (var i=0; i<selectbox.options.length; i++)
		document.write('<a href="../'+selectbox.options[i].value+'">'+selectbox.options[i].text+'</a>')
	document.write('</div></div>')
	selectbox.style.display="none"
	var dhtmlselectbox=document.getElementById("dhtml_"+selectid)
	dhtmlselectbox.style.zIndex=combozindex
	combozindex--
	if (typeof selectwidth!="undefined")
		dhtmlselectbox.style.width=selectwidth
	if (typeof optionwidth!="undefined")
		dhtmlselectbox.getElementsByTagName("div")[0].style.width=optionwidth
	dhtmlselectbox.getElementsByTagName("div")[0].style.top=dhtmlselectbox.offsetHeight-combodropoffsetY+"px"
	if (combodropimage!="")
		dhtmlselectbox.getElementsByTagName("img")[0].style.left=dhtmlselectbox.offsetWidth+3+"px"
	dhtmlselectbox.onmouseover=function(){
		this.getElementsByTagName("div")[0].style.display="block"
	}
	dhtmlselectbox.onmouseout=function(){
		this.getElementsByTagName("div")[0].style.display="none"
	}
}