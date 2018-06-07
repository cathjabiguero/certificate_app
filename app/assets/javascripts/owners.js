// $("#recipient_name").ready(function(){
//   console.log(this.content());
//   var textLength = $(this).val().length;

//   if (textLength < 18){
//       $(this).css('font-size', '70px');
//   } else if(textLength < 30){
//       $(this).css('font-size', '10px');
//   } else if (textLength > 30){
//       $(this).css('font-size', '5px');
//   }
// });


// var hasBeenClicked1 = false;
// var hasBeenClicked2 = false;
// $("#students").click(function(){
//   hasBeenClicked1 = true;
// });
// $("#teachers").click(function(){
//   hasBeenClicked2 = true;
// });

// $('#showpdf').ready(function(){
//   if (hasBeenClicked1){
//     $(this).css('background-image', asset-data-url("student_cert.jpg")); 
//   }
//   else if (hasBeenClicked2){
//       $(this).css('background-image', asset-data-url("teacher_cert.jpg")); 
//   }
// });
// $(document).ready(function(){
//   $('#btnSubmit').click(function(){
//       alert('isChecked');
//     });  
// });
$(document).ready(function() {
  $('#btnStatus').click(function(){
     var isChecked = $('#rdSelect').is(':checked');
     alert(isChecked);
  });
});