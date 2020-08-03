$(document).ready(function(){
    console.log('hello')
    $("#ordered_product_product_id").change(function(){
        if($("#ordered_product_product_id").val() != "0"){
          $(".hidden_field").fadeOut('fast')
        }
          else {
         $(".hidden_field").fadeIn('fast')   
        }            
    });        
});