// document.addEventListener(
//   'DOMContentLoaded', e => {
//     let modal_open = document.getElementById('#modal-open-button');
//     modal_open.onclick = function(){
//       $('#overlay').fadeIn();
//       document.getElementById('modal-close-button').onclick = function(){
//         $('#overlay').fadeOut();
//       };
//     };
//   };
//   false
//   );
$(function() {
  var i = 0;
  while(i < 50){
    const index = i;
    $('#modal-open-button' + index).on('click', function(){
      $('#overlay, #modal-' + index).fadeIn();

    });
  i++;
  };
  
  var i = 0;
  while(i < 50){
    const index = i;
  $('#modal-close-button' + index ).on('click', function(){
    $('#overlay, #modal-' + index).fadeOut();

  });
      i++; 
  };
  
  var i = 0;
  while(i < 50){
    const index = i;
  $('#modal-close-button' + index ).on('click', function(){
    $('#overlay, #modal-' + index).fadeOut();

  });
      i++; 
  };
  
  var i = 0;
  while(i < 50){
    const index = i;
  $('#modal-close-button' + index ).on('click', function(){
    $('#overlay, #modal-' + index).fadeOut();

  });
      i++; 
  };
});

