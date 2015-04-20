$ ->

  if $('.registrations.new').length

    setPaymentRecipeVisibility = (duration) ->
      if $('#user_payment_type').val() is 'bank_transfer'
        $('.user_payment_recipe').show duration
      else
        $('.user_payment_recipe').hide duration

    setPaymentRecipeVisibility 0
    $('#user_payment_type').on 'change', setPaymentRecipeVisibility

  if $('.users.edit').length

    # format a date as 'yyyy-MM-dd'
    datePrint = (date) ->
      date.toJSON().substring 0,10

    setDefaultMembershipDates = ->
      if $('#user_approved').is ':checked'
        memberSince = new Date()
        memberUntil = new Date()
        memberUntil.setFullYear memberSince.getFullYear() + 1
        $('#user_member_since').val datePrint(memberSince)
        $('#user_member_until').val datePrint(memberUntil)
      else
        $('#user_member_since').val ''
        $('#user_member_until').val ''

    $('#user_approved').on 'change', setDefaultMembershipDates

