$(document).on 'click', '.playingCards .choice', (event) ->
  value = $(event.target).closest('.choice').data('value')
  form = $(event.target).closest('form')
  form.find('input[name="play[value]"]').val(value)
  form.submit()

