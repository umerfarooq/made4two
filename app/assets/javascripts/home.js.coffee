tab = ->
  $(".list-account li a").click (e) ->
    e.preventDefault()
    $(this).tab "show"
    return

  return

$(document).ready tab
$(document).on "page:load", tab