class @TdRegistrationsNew
  constructor: ->
    @setPaymentRecipeVisibility()
    $('#user_payment_type').on 'change', =>
      @setPaymentRecipeVisibility()
    @setRolesVisibility()
    $('[name="user\[member_type\]"]').on 'change', =>
      @setRolesVisibility()
  setPaymentRecipeVisibility: ->
    if $('#user_payment_type').val() is 'bank_transfer'
      $('.user_payment_recipe').fadeIn()
    else
      $('.user_payment_recipe').fadeOut()
  setRolesVisibility: ->
    if $('[name="user\[member_type\]"]:checked').val() is 'collaborative'
      $('[data-roles-panel]').fadeIn()
    else
      $('[data-roles-panel]').fadeOut()

window.TdRegistrationsCreate = TdRegistrationsNew
