# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
  recurringTypeSel = $("#recurring-type select")
  recurringEndGroup = $("#recurring-ends-on")
  recurringEndDatepicker = $("#recurring-ends-on").find ".datepicker"

  $(".clickable").click () ->
    window.document.location = $(this).data "href"

  $(".datepicker").datepicker
    autoclose: true,
    format: "dd.mm.yyyy",
    startDate: "today"

  recurringTypeSel.change () ->
    if $(this).val() != ""
      recurringEndGroup.show()
    else
      recurringEndGroup.hide()
      recurringEndDatepicker.datepicker "clearDates"

  $("#due-on .datepicker").datepicker().on "changeDate", (e) ->
    recurringDate = recurringEndDatepicker.datepicker "getDate"

    recurringEndDatepicker.datepicker "setStartDate", e.date

    if recurringDate != null and e.date > recurringDate
      recurringEndDatepicker.datepicker "setDate", e.date

  recurringTypeSel.trigger "change"
