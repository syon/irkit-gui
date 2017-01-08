$(function() {

  $(document).on('click', '.switches button', function(){
    var ir_key = $(this).prop('id');
    $.ajax({
      type: "POST",
      url: "/",
      data: {"ir_key": ir_key},
      success: function(data) {
        $('#result').text(data).show();
      }
    });
  });

});
