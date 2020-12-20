var	inShow = true;
$(document).ready(function() {
	$("#needIns").click(function() {
		if (inShow) {
		$("#detail1").show();
	} else {
		$("#detail1").hide();
	}
	 inShow = !inShow;
	});
	$("#moreIns").click(function() {
		$("#detail2").show();
	});
});
