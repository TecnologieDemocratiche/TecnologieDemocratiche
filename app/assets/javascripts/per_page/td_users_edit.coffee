class @TdUsersEdit
  constructor: ->
    @setRolesVisibility()
    $('[name="user\[member_type\]"]').on 'change', =>
      @setRolesVisibility()
  setRolesVisibility: ->
    if $('[name="user\[member_type\]"]:checked').val() is 'collaborative'
      $('[data-roles-panel]').fadeIn()
    else
      $('[data-roles-panel]').fadeOut()

