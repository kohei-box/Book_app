
$(function() {
  var i = 0;
  while(i < 50){
    const index = i;
    $('#modal-open-button-' + index).on('click', function(){
      $('#overlay, #modal-' + index).fadeIn();

    });
  i++;
  };
  
  var i = 0;
  while(i < 50){
    const index = i;
  $('#modal-close-button-' + index ).on('click', function(){
    $('#overlay, #modal-' + index).fadeOut();

  });
      i++; 
  };
  
  var i = 0;
  while(i < 50){
    const index = i;
  $('#modal-open-button2-' + index ).on('click', function(){
    $('#modal-' + index).fadeOut();
    $('#modal2-' + index).fadeIn();
  });
      i++; 
  };
  
  var i = 0;
  while(i < 50){
    const index = i;
  $('#modal-close-button2-' + index ).on('click', function(){
    $('#overlay, #modal2-' + index).fadeOut();

  });
      i++; 
  };
});

