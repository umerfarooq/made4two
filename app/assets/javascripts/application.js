// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require home
//= require social-share-button
//= require jquery.payment
//= require orders
//= require jquery.geocomplete
//= require nprogress
//= require nprogress-turbolinks
NProgress.configure({
  showSpinner: true,
  ease: 'ease',
  speed: 500
});
jQuery(function($){
  $('#card_number').payment('formatCardNumber');
  $('#cvc').payment('formatCardCVC');

});
$(function() {
  window.prettyPrint && prettyPrint()
  $(document).on('click', '.yamm .dropdown-menu', function(e) {
    e.stopPropagation()
  });
});

var total = 0;
function increment(form,id,price){
  var total_price = (price * form.value)
  total_price1 = total_price.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
  $('#total_price_'+id).text('£'+total_price1);
  $('#total_price_'+id).attr('data-price',total_price);
  val = 0;
  $("span[id^='total_price_']").each(function(){      
    val = parseInt($(this).attr('data-price')) + val;
  });
  sub_total = val.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
  $('.subtotal_price').text("£"+sub_total);
  var discount = $('#discount').html();
  if(discount == '0 %'){
    
    $('#subtotal').text("£"+val.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,'));
    total = val*100;
    $('#amount_total').val(total);
  }else{
    var discount = discount.split(" ");
    discount = (val * discount[1]) / 100;
    val = val - discount;
    $('#subtotal').text("£"+val.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,'));
    total = val*100;
    $('#amount_total').val(total);
  }
  
  $("#submit_btn_"+id).click();
}
$(document).ready(function(){
  // checked gift
  $('#gift_check').click(function(){
    if($(this).prop("checked") == true){
      $('#order_gift').val(true)
    }else{
      $('#order_gift').val(false)
    }
  });
  //recipient first name
  $('#gift_firstname').keyup(function(){
    $('#order_firstname').val($(this).val());
    
  });
  $('#gift_lastname').keyup(function(){
    $('#order_lastname').val($(this).val());
    
  });
  $('#gift_message').keyup(function(){
    $('#order_message').val($(this).val());
  });

  $('.gift_certicate').click(function(){
    $('#order_certicate').val($(this).val());
  });
  $('#gift_email').keyup(function(){
    $('#order_email').val($(this).val());
  });
  $('a').tooltip();
});
