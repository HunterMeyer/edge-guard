var subscription;

jQuery(function() {
  $('#process-card').click(function() {
    return subscription.setUpForm();
  });
});

subscription = {
  setUpForm: function() {
    $('#process-card').addClass('loading');
    subscription.processCard();
  },
  processCard: function() {
    var card;
    card = {
      number: $('#card_number').val(),
      cvc: $('#card_code').val(),
      expMonth: $('#card_month').val(),
      expYear: $('#card_year').val()
    };
    $('#card_number').val('');
    $('#card_code').val('');
    $('#card_month').val('');
    $('#card_year').val('');
    return Stripe.createToken(card, subscription.handleStripeResponse);
  },
  handleStripeResponse: function(status, response) {
    if (status === 200) {
      type = $('#subscriber_type').val();
      $('#' + type + '_card_token').val(response.id);
      return $('.subscriber-form').submit();
    } else {
      $('#stripe-error label').text(response.error.message);
      return $('#process-card').removeClass('loading');
    }
  }
};
