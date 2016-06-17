function isNumber(field) {
	if ( (document.getElementById(field).value == "") || isNaN(document.getElementById(field).value)) {
		alert('This is not a number! Please enter a valid number.');
		document.getElementById(field).focus();
		document.getElementById(field).select();
		return false;
	} else {
		return true;
	}
}