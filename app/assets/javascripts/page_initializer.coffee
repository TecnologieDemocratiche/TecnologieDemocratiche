class PageInitializer
  constructor: ->
    page = "Td#{$('body').data('page')}"
    @execute_page_js(page)
  execute_page_js: (page) ->
    if 'function' is typeof window[page]
      klass = window[page]
      new klass()

$ ->
  new PageInitializer()
$(document).on 'page:load', ->
  new PageInitializer()
