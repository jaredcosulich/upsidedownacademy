$ ->
  $(".toggle_tip").click ->
    $(this).closest(".tip").find(".tip_text").toggle()
