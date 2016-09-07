module ApplicationHelper
  def full_title(page_title)
    'EDGE GUARD 2016 | ' + page_title
  end

  def generate_form_errors(errors)
    return unless errors.present?
    content_tag(:div, class: 'ui error message') do
      content_tag(:div, 'Oops. Something went wrong:', class: 'header') +
      errors.full_messages.map { |message| content_tag(:div, message) }.join.html_safe
    end
  end

  def payment_call_to_action(subscriber)
    discount_end = subscriber.discount_end_date
    return if discount_end.past?
    "Act fast! On #{discount_end.strftime('%b %d')} the fee goes up to $#{subscriber.full_fee}"
  end

  def formatted(text)
    matches = /(http\S*)/.match(text)
    return text unless matches
    matches.captures.each { |url| text.gsub!(url, link_to(url, url, target: '_blank')) }
    text.html_safe
  end
end
