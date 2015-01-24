$(document).on 'click', '.playingCards .choice', (event) ->
  value = $(event.target).closest('.choice').data('value')
  form = $(event.target).closest('form')
  if not form.data('disabled')
    form.find('input[name="play[value]"]').val(value)
    form.submit()

$(document).on 'ajax:before', 'form.new_play', ->
  # 'disabled' is looks for above
  $(this).data 'disabled', true

$(document).on 'ajax:success', 'form.new_play', ->
  $(this).closest('div.create_play').remove()

$(document).on 'ajax:error', 'form.new_play', ->
  $(this).data 'disabled', false
