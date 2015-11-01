ready = ->
  if $('.edit_user').length
    isApproved = ->
      $('#user_approved').is ':checked'
    datePrint = (date) ->
      date.toJSON().substring 0, 10
    setDates = ->
      memberSince = new Date()
      memberUntil = new Date()
      memberUntil.setFullYear memberSince.getFullYear() + 1
      $('#user_member_since').fdatepicker('update', memberSince)
      $('form').formValidation('revalidateField', 'user[member_since]')
      $('#user_member_until').fdatepicker('update', memberUntil)
      $('form').formValidation('revalidateField', 'user[member_until]')
    clearDates = ->
      $('#user_member_since').fdatepicker('update', null)
      $('#user_member_until').fdatepicker('update', null)
    setDefaultMembershipDates = ->
      if isApproved()
        $('[data-membership]').show()
        setDates()
      else
        $('[data-membership]').hide()
        clearDates()
    $('#user_approved').on 'change', setDefaultMembershipDates
    if isApproved()
      $('[data-membership]').show()
    else
      $('[data-membership]').hide()

$(document).ready(ready)
$(document).on('page:load', ready)
