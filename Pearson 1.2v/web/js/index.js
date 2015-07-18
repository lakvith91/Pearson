function checkPass()
{
    //Store the password field objects into variables ...
    var pass1 = document.getElementById('pass1');
    var pass2 = document.getElementById('pass2');
    //Store the Confimation Message Object ...
    var message = document.getElementById('confirmMessage');
    //Set the colors we will be using ...
    var goodColor = "#66cc66";
    var badColor = "#ff6666";
    //Compare the values in the password field 
    //and the confirmation field
    if(pass1.value == pass2.value){
        //The passwords match. 
        //Set the color to the good color and inform
        //the user that they have entered the correct password 
        pass2.style.backgroundColor = goodColor;
        message.style.color = goodColor;
        message.innerHTML = "Passwords Match!"
    }else{
        //The passwords do not match.
        //Set the color to the bad color and
        //notify the user.
        pass2.style.backgroundColor = badColor;
        message.style.color = badColor;
        message.innerHTML = "Passwords Do Not Match!"
    }
}  

// Below function Executes on click of login button.
function validate(){
var username = document.getElementById("username").value;
var password = document.getElementById("password").value;
if ( username == "employee" && password == "123"){
window.location = "home_page.jsp"; // Redirecting to other page.
return false;
}
else if ( username == "manager" && password == "123"){
window.location = "home_page.jsp"; // Redirecting to other page.
return false;
}

else{
 $(form_1).parent()
           .removeClass('has-success')
           .addClass('has-error');
   
  
return false;
}

}

//script for Add data into table in claim add data form

   function AddData(){
        var x = document.getElementById("age").value;
        var y = document.getElementById("name").value;
        var letters = '/^[a-zA-Z]+$/'; 
        if((parseInt(x)!=(x))&&(y==parseInt(y))){
            alert("Wrong Value Entered");
        }
        else{
            var rows = "";
            var name = document.getElementById("gender").value;
            var gender = document.getElementById("gender").value;
            var age = document.getElementById("age").value;
            var city = document.getElementById("city").value;   

            rows += "<tr><td>" + name + "</td><td>" + gender + "</td><td>" + age + "</td><td>" + city + "</td></tr>";
            $(rows).appendTo("#list tbody");
        }   
    }

    function ResetForm(){
        document.getElementById("person").reset();
    }

// jQuery to collapse the navbar on scroll

$(window).scroll(function() {
    if ($(".navbar").offset().top > 50) {
        $(".navbar-fixed-top").addClass("top-nav-collapse");
    } else {
        $(".navbar-fixed-top").removeClass("top-nav-collapse");
    }
});


// jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });
});

// Function for loding invisible about div

function swap(about, description,feature,middle) {
    document.getElementById(about).style.display = 'block';
    document.getElementById(description).style.display = 'none';
     document.getElementById(feature).style.display = 'none';
      document.getElementById(middle).style.display = 'none';


}

   

  
