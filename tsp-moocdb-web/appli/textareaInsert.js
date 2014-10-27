function insertAtCursor(myField, myValue) {
//IE support
	if (top.frames[1].document.selection) {
    top.frames[1].document.getElementById(myField).focus();
    sel = top.frames[1].document.selection.createRange();
    sel.text = myValue;
	}
//MOZILLA and others
	else if (top.frames[1].document.getElementById(myField).selectionStart || top.frames[1].document.getElementById(myField).selectionStart == '0') {
    var startPos = top.frames[1].document.getElementById(myField).selectionStart;
    var endPos = top.frames[1].document.getElementById(myField).selectionEnd;
    var stringVal =  top.frames[1].document.getElementById(myField).value;
    top.frames[1].document.getElementById(myField).value = stringVal.substring(0, startPos)
        + myValue
        + stringVal.substring(endPos, stringVal.length);
     top.frames[1].document.getElementById(myField).selectionStart = startPos + myValue.length;
     top.frames[1].document.getElementById(myField).selectionEnd = startPos + myValue.length;
	} else {
    top.frames[1].document.getElementById(myField).value += myValue;
	}
}