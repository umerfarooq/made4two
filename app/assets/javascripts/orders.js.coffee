jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  pay.setupForm()

pay =
  setupForm: ->
    $('#order_new_form').submit ->
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').length
        pay.processCard()
        false
      else
        true
  
  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#cvc').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, pay.handleStripeResponse)
  
  handleStripeResponse: (status, response) ->
    if status == 200
      $('#order_stripe_card_token').val(response.id)
      $('.alert').removeClass('alert-danger').addClass('alert-success')
      $('.alert').text('Card valid !')
      $('#order_new_form')[0].submit()
    else
      $('#stripe_error').html("<div class='alert-danger alert'>"+response.error.message+"</div>")
      $('[type=submit]').attr('disabled', false)