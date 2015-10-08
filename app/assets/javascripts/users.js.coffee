ready = ->
  if $('.users.edit').length
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

$(document).ready(ready)
$(document).on('page:load', ready)
