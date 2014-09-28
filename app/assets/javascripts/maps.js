$(function(){
  $('.maps').replaceWith("<div class='maps'></div>");

  $("#tour_location").geocomplete({
    map: ".maps"
  });
});
$(function(){
  tinymce.init({
    selector: "#tour_description"
 });
});
$(function(){
  tinymce.init({
  	plugins: [
        "advlist autolink lists link image charmap print preview hr anchor pagebreak",
        "searchreplace wordcount visualblocks visualchars code fullscreen",
        "insertdatetime media nonbreaking save table contextmenu directionality",
        "emoticons template paste textcolor colorpicker textpattern"
    ],
    selector: "#page_content"
 });
});