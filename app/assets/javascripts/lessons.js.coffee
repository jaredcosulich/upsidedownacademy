$ ->
  self = this;
  setDefault = (input)->
    input = $(input)
    input.val(input.attr("data-hint")) if input.val().length == 0
    input.addClass("hinted") if input.val() == input.attr("data-hint")

  clearIfDefault = (input) ->
    if $(input).val() == $(input).attr("data-hint")
      $(input).val("")
      $(input).removeClass("hinted")

  setUnsavedWarning = ->
    window.onbeforeunload = ->
      "You may have unsaved changes. Are you sure you want to leave this page?";


  $("input[data-hint]").focus ->
    clearIfDefault(this)
  .blur ->
    setDefault(this)
  .each ->
    setDefault(this)

  $("form").submit ->
    $.each($("input[data-hint]"), ->
      clearIfDefault(this)
    );

  $(".publish_lesson a").click ->
    $(this).closest("form").submit() if confirm("Are you sure you're ready to publish this lesson?")

  $(".monitor_changes").keypress ->
    setUnsavedWarning()
  $(".monitor_changes").change ->
    setUnsavedWarning()



