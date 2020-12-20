var setDay;
var price = true;
$(document).ready(function() {
	  $("#chosenDate").click(function() {
			setDay = document.getElementById("chosenDate").value;
			document.getElementById("guideDate").innerHTML = setDay;
});
 $("#shopping").click(function() {
 	if (price) {
			document.getElementById("guidePrice").innerHTML = "$" + 25;
		}else {
			document.getElementById("guidePrice").innerHTML = "$" + 15;
		}
		price = !price;
});
	});
