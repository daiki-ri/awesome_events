$(document).on 'ajax:success', '#createUserEvent', (xhr, data, status) ->
  location.reload()
$(document).on 'ajax:error', '#createUserEvent', (xhr, data, status) ->
    form = $('#new_user_event .modal-body')
    div = $('<div id="createUserEventErrors" class="alert alert-danger"></div>')
    ul = $('<ul></ul>')
    data.responseJSON.messages.forEach (message, i) ->
      li = $('<li></li>').text(message)
      ul.append(li)


    if $('#createUserEventErrors')[0]
      $('#createUserEventErrors').html(ul)
    else
      div.append(ul)
      form.prepend(div)
