$ ->

  setPaymentRecipeVisibility = (duration) ->
    if $('#user_payment_type').val() == 'bank_transfer'
      $('.user_payment_recipe').show duration
    else
      $('.user_payment_recipe').hide duration
    return

  setPaymentRecipeVisibility 0
  $('#user_payment_type').on 'change', setPaymentRecipeVisibility
  return
