$("#content_stuff").hide().html("<%= escape_javascript render(@messages) %>").fadeIn()
$(".pagination").html "<%= escape_javascript(paginate(@messages, :remote => true).to_s) %>"