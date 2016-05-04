source = new EventSource '/sse'

source.addEventListener 'message', ((e) ->
  console.log e.data
  comment = $.parseJSON(e.data)
  console.log comment
  str = "<tr><td>#{comment.commentator} : </td><td>#{comment.body}</td><td>#{comment.created_at}</td></tr>"
  $('table').append(str).hide().fadeIn('slow');
), false

source.addEventListener 'open', ((e) ->
  console.log 'open'
), false

source.addEventListener 'error', ((e) ->
  if e.readyState == EventSource.CLOSED
    console.log 'connection CLOSED'
  else
  # console.log e
  console.log 'error'
), false
