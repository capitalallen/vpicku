var pickupair;
var destinaed;
var destinaed2;
var numCus;
var selDate;
var selDateB;
var priceEach;
var servecheck;
var guideFeeOn = true;
var shopping = true;
var insuranceFee;
localStorage.guideFee = "0";
$(document).ready(function() {
  $("#servcheck").click(function() {
    if (guideFeeOn) {
      document.getElementById("guideFee").innerHTML = "$" + 15;
      document.getElementById("totalFee").innerHTML = "$" + Math.floor(localStorage.priceCar * 0.1 + 1.5);
      if (document.getElementById("oneIns").selected) {
        document.getElementById("finalFee").innerHTML = "$" + Math.floor(localStorage.priceCar * 1.1 + 15*1.1 + 2.5);
    } else if (document.getElementById("twoIns").selected) {
        document.getElementById("finalFee").innerHTML = "$" + Math.floor(localStorage.priceCar * 1.1 + 15*1.1 + 5);
    }
	 localStorage.guideFee = "15";
	 $(".guideitem").show();
  } else {
      document.getElementById("guideFee").innerHTML = "$" + 0;
      document.getElementById("totalFee").innerHTML = "$" + Math.floor(localStorage.priceCar * 0.1);
      if (document.getElementById("oneIns").selected) {
        document.getElementById("finalFee").innerHTML = "$" + Math.floor(localStorage.priceCar * 1.1 + 2.5);
    } else if (document.getElementById("twoIns").selected) {
        document.getElementById("finalFee").innerHTML = "$" + Math.floor(localStorage.priceCar * 1.1 + 5);
    }
		localStorage.guideFee = "0";
		 $(".guideitem").hide();		
  }
      guideFeeOn = !guideFeeOn;
  });

      $("#guidelistC").click(function(){ 
      if (shopping) {
      document.getElementById("guideFee").innerHTML = "$" + 25;
      document.getElementById("totalFee").innerHTML = "$" + Math.floor(localStorage.priceCar * 0.1 + 2.5);
      if (document.getElementById("oneIns").selected) {
        document.getElementById("finalFee").innerHTML = "$" + Math.floor(localStorage.priceCar * 1.1 + 27.5);
    } else if (document.getElementById("twoIns").selected) {
        document.getElementById("finalFee").innerHTML = "$" + Math.floor(localStorage.priceCar * 1.1 + 30);
    }
      localStorage.guideFee = "25"
    } else {
      document.getElementById("guideFee").innerHTML = "$" + 15;
      document.getElementById("totalFee").innerHTML = "$" + Math.floor(localStorage.priceCar * 0.1 + 1.5);
       if (document.getElementById("oneIns").selected) {
        document.getElementById("finalFee").innerHTML = "$" + Math.floor(localStorage.priceCar * 1.1 + 15 + 2.5);
    } else if (document.getElementById("twoIns").selected) {
        document.getElementById("finalFee").innerHTML = "$" + Math.floor(localStorage.priceCar * 1.1 + 15 + 5);
      }
    }
    shopping = !shopping;
    });
  //Define economy car
  $("#dstuni").click(function() {
    destinaed = document.getElementById("dstuni").value;
    $("#taxA").show();
    if (destinaed == "University Of Toronto") {
      document.getElementById("priceShow").innerHTML = "$45";
      document.getElementById("hourShow").innerHTML = "Total time: 0.5 hour";
      localStorage.priceCar = 45;
    } else if (destinaed == "Waterloo") {
      document.getElementById("priceShow").innerHTML = "$80";
      document.getElementById("hourShow").innerHTML = "Total time: 1.5 hours";
      localStorage.priceCar = 80;
    } else if (destinaed == "Western") {
      document.getElementById("priceShow").innerHTML = "$160";
      document.getElementById("hourShow").innerHTML = "Total time: 2 hours";
      localStorage.priceCar = 160;
    } else if (destinaed == "York") {
      document.getElementById("priceShow").innerHTML = "$40";
      document.getElementById("hourShow").innerHTML = "Total time: 0.5 hour";
      localStorage.priceCar = 40;
    } else if (destinaed == "McMaster") {
      document.getElementById("priceShow").innerHTML = "$105";
      document.getElementById("hourShow").innerHTML = "Total time: 1.5 hours";
      localStorage.priceCar = 105;
    } else if (destinaed == "George Brow") {
      document.getElementById("priceShow").innerHTML = "$50";
      document.getElementById("hourShow").innerHTML = "Total time: 0.5 hour";
      localStorage.priceCar = 50;
    } else if (destinaed == "Laurier") {
      document.getElementById("priceShow").innerHTML = "$80";
      document.getElementById("hourShow").innerHTML = "Total time: 1.5 hours";
      localStorage.priceCar = 80;
    } else if (destinaed == "Fanshawe") {
      document.getElementById("priceShow").innerHTML = "$160";
      document.getElementById("hourShow").innerHTML = "Total time: 2 hours";
      localStorage.priceCar = 160;
    }
    localStorage.destinaedu = destinaed;
  });

  $("#selectbut").click(function() {
    localStorage.selectcar = "car";
    selDate = document.getElementById("datepicker").value;
    localStorage.curDate = selDate;
    window.open("confirmation.html");
  });

  $("#numpicker").click(function() {
    numCus = document.getElementById("numpicker").value;
    localStorage.numPass = numCus;
  });


  //Define business van
  $("#dstuniB").click(function() {
    destinaed2 = document.getElementById("dstuniB").value;
    $("#taxB").show();
    if (destinaed2 == "University Of Toronto") {
      document.getElementById("priceShowB").innerHTML = "$55";
      document.getElementById("hourShowB").innerHTML = "Total time: 0.5 hour";
      localStorage.priceCar = 55;
    } else if (destinaed2 == "Waterloo") {
      document.getElementById("priceShowB").innerHTML = "$90";
      document.getElementById("hourShowB").innerHTML = "Total time: 1.5 hours";
      localStorage.priceCar = 90;
    } else if (destinaed2 == "Western") {
      document.getElementById("priceShowB").innerHTML = "$200";
      document.getElementById("hourShowB").innerHTML = "Total time: 2 hours";
      localStorage.priceCar = 200;
    } else if (destinaed2 == "York") {
      document.getElementById("priceShowB").innerHTML = "$50";
      document.getElementById("hourShowB").innerHTML = "Total time: 0.5 hour";
      localStorage.priceCar = 50;
    } else if (destinaed2 == "McMaster") {
      document.getElementById("priceShowB").innerHTML = "$115";
      document.getElementById("hourShowB").innerHTML = "Total time: 1.5 hours";
      localStorage.priceCar = 115;
    } else if (destinaed2 == "George Brown") {
      document.getElementById("priceShowB").innerHTML = "$60";
      document.getElementById("hourShowB").innerHTML = "Total time: 0.5 hour";
      localStorage.priceCar = 60;
    } else if (destinaed2 == "Laurier") {
      document.getElementById("priceShowB").innerHTML = "$90";
      document.getElementById("hourShowB").innerHTML = "Total time: 1.5 hours";
      localStorage.priceCar = 90;
    } else if (destinaed2 == "Fanshawe") {
      document.getElementById("priceShowB").innerHTML = "$200";
      document.getElementById("hourShowB").innerHTML = "Total time: 2 hours";
      localStorage.priceCar = 200;
    }
    localStorage.destinaedu = destinaed2;
  });
  $("#selectbut2").click(function() {
    localStorage.selectcar = "Van/SUV";
    selDateB = document.getElementById("datepickerB").value;
    localStorage.curDate = selDateB;
    window.open("confirmation.html");
  });

  $("#numpickerB").click(function() {
    numCus = document.getElementById("numpickerB").value;
    localStorage.numPass = numCus;
  });
  $("#moreIns").click(function() {
    $("#detail2").show();
    if (document.getElementById("oneIns").selected) {
        document.getElementById("finalFee").innerHTML = "$" + (localStorage.priceCar * 1 + localStorage.priceCar * 0.1+ localStorage.guideFee*1 + 2.5);
    } else if (document.getElementById("twoIns").selected) {
        document.getElementById("finalFee").innerHTML = "$" + (localStorage.priceCar * 1 + localStorage.priceCar * 0.1+ localStorage.guideFee*1 + 5);
    }
  });
});

//define car type for confirmation page
function confirmload() {
  document.getElementById("presentDate").innerHTML = Date();
  document.getElementById("spanunivers").innerHTML = localStorage.destinaedu;
  document.getElementById("numPassengers").innerHTML = localStorage.numPass;
  document.getElementById("dateSelect").innerHTML = localStorage.curDate;
  document.getElementById("guideFee").innerHTML = "$" + localStorage.guideFee;
  document.getElementById("priceBefore").innerHTML = "$" + localStorage.priceCar;
  document.getElementById("totalFee").innerHTML = "$" + localStorage.priceCar * 0.1;
  document.getElementById("finalFee").innerHTML = "$" + (localStorage.priceCar * 1 + localStorage.priceCar * 0.1+ localStorage.guideFee*1);
  if (localStorage.selectcar == "car") {
    document.getElementById("typeCar").innerHTML = "Car";
  } else if (localStorage.selectcar == "Van/SUV") {
    document.getElementById("typeCar").innerHTML = "Van/SUV";
  } 
  
  var stext="";////服务内容的保存
  stext=stext+"University:<span>"+ localStorage.destinaedu+"</span><BR>";
  stext=stext+"Type of Car:<span>"+ localStorage.selectcar+"</span><BR>";
  stext=stext+"passengers:<span>"+ localStorage.numPass+"</span><BR>";
  stext=stext+"Price:<span>$"+ localStorage.priceCar+"</span><BR>";
  stext=stext+"Guide Fee:$<span>"+ localStorage.guideFee+"</span><BR>";
  stext=stext+"Fees:<span>$"+ localStorage.priceCar*0.1+"</span><BR>";
 // stext=stext+"Date:"+ Date()+"<BR>";
  stext=stext+"Total Fees :<span>$"+ (localStorage.priceCar*1.1+ localStorage.guideFee*1).toFixed(2)+"</span><BR>";
  stext=stext+"Pickup Date:<span>"+ localStorage.curDate+"</span><BR>";
  //document.getElementById("test").innerHTML = stext;
  document.getElementById("servertext").value=stext; 
}
