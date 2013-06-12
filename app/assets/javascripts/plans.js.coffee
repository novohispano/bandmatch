# listen to successful posts from comment form
$(document).on 'ajax:success', '.comments-form', (e, html) ->
  # insert the new comment partial to the top of the comments list
  $(html).insertAfter('.comments-form')
  # reset the form to clear out previously entered text
  $('.comments-form form').get(0).reset()
