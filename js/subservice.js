$(document).ready(function() {
	$("#reservebutton").click(function() {
		if (document.getElementById("firstname").value==""){
	    alert("Please fill firstname");
		return false;
	}
		if (document.getElementById("lastname").value==""){
	    alert("Please fill lastname");
		return false;
	}

	if (document.getElementById("email").value==""){
		alert('Please fill email');
		return false;
	}	
	
	var bdemail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		if (!bdemail.test(document.getElementById("email").value)){
	    alert('Please fill email');
		return false;
	}	
	if (document.getElementById("phone").value==""){
		alert('Please fill phone');
		return false;
	}
	
	});
});