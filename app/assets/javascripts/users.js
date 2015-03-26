
$(function () {
  setPaymentRecipeVisibility(0);
  $('#user_payment_type').on('change', setPaymentRecipeVisibility);

  function setPaymentRecipeVisibility(duration) {
    if($('#user_payment_type').val() == 'not_yet') {
      $('.user_payment_recipe').hide(duration);
    } else {
      $('.user_payment_recipe').show(duration);
    }
  }
});


