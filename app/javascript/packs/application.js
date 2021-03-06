// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")


$(document).on('turbolinks:load', function() {
  $(".alert" ).fadeOut(4000);

  $('.submit-task').hide();

  $('.add-task').on('click', function(){
    $('.submit-task').show();
  })

  $('form').on('click', '.add_fields', function(event){
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    return event.preventDefault();
  });

  $('form').on('click', '.delete-input', function(event) {
    $(this).prev('input[class=remove]').val('1');
    $(this).closest('.task-input').hide();
    return event.preventDefault();
  });
})


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
