$ ->
  setDefault = (input)->
    input = $(input)
    input.val(input.attr("data-hint")) if input.val().length == 0
    input.addClass("hinted") if input.val() == input.attr("data-hint")

  $("input[data-hint]").focus ->
    if $(this).val() == $(this).attr("data-hint")
      $(this).val("")
      $(this).removeClass("hinted")
  .blur ->
    setDefault(this)
  .each ->
    setDefault(this)
