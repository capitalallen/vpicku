$(document).ready(function() {
  	$("#univerName").click(function() {
  	localStorage.unName1 = "University of Toronto";
  });
    $("#univerName1").click(function() {
  	window.open("mcmasterguide.html");
  	localStorage.unName1 = "Universtity of Waterloo";
  });
    $("#univerName2").click(function() {
  	window.open("mcmasterguide.html");
  	localStorage.unName1 = "Western University";
  });
    $("#univerName3").click(function() {
  	window.open("mcmasterguide.html");
  	localStorage.unName1 = "York Unversity";
  });
    $("#univerName4").click(function() {
  	window.open("mcmasterguide.html");
  	localStorage.unName1 = "Mcmaster Unversity";
  });
    $("#univerName5").click(function() {
  	window.open("mcmasterguide.html");
  	localStorage.unName1 = "George Brown College";
  });
    $("#univerName6").click(function() {
  	window.open("mcmasterguide.html");
  	localStorage.unName1 = "Laurier Unversity";
  });
    $("#univerName7").click(function() {
  	window.open("mcmasterguide.html");
  	localStorage.unName1 = "Fanshawe Unversity";
  });
});

function univerName() {
	if (localStorage.unName1  == "University of Toronto") {
	document.getElementById("unName").innerHTML = "University of Toronto";
	} 
	else if (localStorage.unName1 == "Universtity of Waterloo") {
	document.getElementById("unName").innerHTML = "Universtity of Waterloo";
	} 
	else if (localStorage.unName1 == "Western University") {
	document.getElementById("unName").innerHTML = "Western University";
	}
	else if (localStorage.unName1 == "York Unversity") {
	document.getElementById("unName").innerHTML = "York Unversity";
	}
	else if (localStorage.unName1 == "Mcmaster Unversity") {
	document.getElementById("unName").innerHTML = "Mcmaster Unversity";
	}
	else if (localStorage.unName1 == "George Brown College") {
	document.getElementById("unName").innerHTML = "George Brown College";
	}
	else if (localStorage.unName1 == "Laurier Unversity") {
	document.getElementById("unName").innerHTML = "Laurier Unversity";
	}
	else if (localStorage.unName1 == "Fanshawe Unversity") {
	document.getElementById("unName").innerHTML = "Fanshawe Unversity";
	}
}
