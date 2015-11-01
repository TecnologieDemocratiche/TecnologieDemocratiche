class PageInitializer
  constructor: ->
    page = "Td#{$('body').data('page')}"
    @execute_page_js(page)
  execute_page_js: (page) ->
    if 'function' is typeof window[page]
      klass = window[page]
      new klass()

class TecnologieDemocratiche
  constructor: ->
    $(document).foundation()
    $('form[name!="paypal"]').formValidation
      framework: 'foundation'
      icon:
        valid: 'fa fa-check'
        invalid: 'fa fa-times'
        validating: 'fa fa-refresh'
      trigger: 'blur'
      row:
        selector: '.input'
    $('[data-datepicker]').fdatepicker
      language: 'it'
    $('[data-datepicker]').on 'changeDate', (e)->
      $('form').formValidation('revalidateField', $(this).attr('name'))

$ ->
  new PageInitializer()
  new TecnologieDemocratiche()
$(document).on 'page:load', ->
  new PageInitializer()
  new TecnologieDemocratiche()
