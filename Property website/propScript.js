// this is the ui for the submit button where it will check all the parameters that were set by the user when they interacted with the other ui options
$(document).ready(function(){
    $( ".widget button" ).button();
        $( "#submit" ).on("click",function() {
            var property = $("input[type='radio']:checked").val();
            var min = $("#slider-range").slider("option","values")[0];
            var max = $("#slider-range").slider("option","values")[1];
            var date =  $("#time2").val();
            var date2 =  $("#time").val();
            var num2 = $("#number").val();
            var num = $("#number2").val();
            var output = "<ul>";
            // once these are all checked it will go to the JSON data and check if these values match
            for (var i in data.properties){
              if (( date >= data.properties[i].added.month && date2 <= data.properties[i].added.month) || (date == "Anytime") && (date2 == "Anytime"))
              if ((num >= data.properties[i].bedrooms && num2 <= data.properties[i].bedrooms))
              if ((property == data.properties[i].type) || (property == "All"))
              if ((data.properties[i].price >= min) && (data.properties[i].price <= max))
              {
                {
                  //if these values match then they will be displayed by collecting the strings and numbers from the JSON data
                output +=  "<section>"+"<img src="+data.properties[i].picture+">"+"<li>"+"<br>"
                +data.properties[i].type+"<br> Bedrooms:"+data.properties[i].bedrooms+"<br> £"+
                data.properties[i].price+"<br> "+data.properties[i].tenure+"<br> "+data.properties[i].description+
                "<br> "+data.properties[i].location+"<br> "+ 
                data.properties[i].added.day+" "+data.properties[i].added.month+" "+data.properties[i].added.year+ 
                "</img>"+"<br>"+"<a href='"+ data.properties[i].url+"'>View property</a></li>"+"</section>";
                }
              }
            }
            //these will then be displayed back to the main page of the search page
            output+="<ul>";
            document.getElementById("prop").innerHTML = output;
            });
    
    //when the user clicks on the save button then it will begin to create the data needed for the value to be stored in local storage
    $(".save").on("click", function(){
      try{
          // This is where the key for the local storage is created and then it checks that the field is empty so that it can create and array 
        $(this).attr("disabled",true);
        var propIdAdd = document.getElementsByTagName("p")[0].id;
        var myFavouriteProp = JSON.parse(localStorage.getItem("favProp"));
        if (myFavouriteProp == null){
          myFavouriteProp = [];
        }
        //If the array is already filled with the same values then it will check to see if it mateches with the id given and keep the array from filling in that name again
        if(myFavouriteProp != null) {
          for ( var j = 0; j < myFavouriteProp.length; j++) {
            
            if ( propIdAdd == myFavouriteProp[j]) {
              
              alert("This property is already in your favourites"); 
              myFavouriteProp = [];
            }
          }
        }
         //the id for the page is stored in the local storage here and is now a value 
        myFavouriteProp.push(propIdAdd);
        localStorage.setItem("favProp",JSON.stringify(myFavouriteProp));
        alert("Saved to your favourites list");
      }
      
      catch(e){
        if (e == QUOTA_EXCEEDED_ERR){
          console.log("Error: Storage exeeded");
        }
        else{
          console.log("Error: Saving to Storage");
        }
      }
    });
        // when you click on the button to view all the properties that were saved to the favourites tab
          $("#viewFavourites").on("click",function(){
            console.log("displaying array data from local storage");
            myFavouriteProp = JSON.parse(localStorage.getItem("favProp"));
            var output = "<ul>";
            // if there are values in the array then it will check if the id from the pages matches with the JSON datas content and if it does then they will be displayed
            if (myFavouriteProp != null){
                for (var i=0; i<data.properties.length; i++){
                    for (j=0; j<myFavouriteProp.length; j++){
                        if(data.properties[i].id == myFavouriteProp[j]){
                            output += "<section>"+"<li>" + "<img src="+data.properties[i].picture+">"+"<br>"+data.properties[i].type+"<br> Bedrooms:"+data.properties[i].bedrooms+"<br> £"+data.properties[i].price+"<br> "+data.properties[i].tenure+"<br> "+data.properties[i].description+"<br> "+data.properties[i].location+"<br> "+ data.properties[i].added.day+" "+data.properties[i].added.month+" "+data.properties[i].added.year+ "</img>"+"<br>"+"<a href='"+ data.properties[i].url+"'>View property</a>"+"</section>"; 
                        }
                    }
                }
            }
            // if there were no values in the array then it will display this message
            if (myFavouriteProp == null){
              alert("The list is empty try adding a favourite property");
            }
        output+="<ul>";
        // the results will be displayed on the property search page
        document.getElementById("ting").innerHTML = output;
        alert("If you want to see properties while also looking at the list then it will be atthe bottom of the page")
    }); 

    // when the user clicks for all of the favourites list to be removed then it will erase the entirery of the local storage by removing the key
    $("#removeFavourites").on("click",function(){
      console.log("removing array data from local storage");
      localStorage.removeItem("favProp");
      alert("removed from the favourites list")
    });

});  