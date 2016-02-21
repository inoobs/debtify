# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
  recurringTypeSel = $("#recurring-type select")
  recurringEndGroup = $("#recurring-ends-on")
  recurringEndDatepicker = $("#recurring-ends-on").find ".datepicker"
  dueOnDatepicker = $("#due-on .datepicker")

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

  dueOnDatepicker.on "blur", () ->
    recurringDate = recurringEndDatepicker.datepicker "getDate"
    date = dueOnDatepicker.datepicker "getDate"

    if date != null
      recurringEndDatepicker.datepicker "setStartDate", date

    if recurringDate != null and date > recurringDate
      recurringEndDatepicker.datepicker "setDate", date

  dueOnDatepicker.datepicker().on "changeDate", (e) ->
    dueOnDatepicker.trigger "blur"

  recurringTypeSel.trigger "change"

  dueOnDatepicker.trigger "blur"
