module ApplicationHelper
  def full_title(page_title)
    (page_title.presence || '2016 Gaming Tournament') + ' | Melvin'
  end

  def generate_form_errors(errors)
    content_tag(:div, class: 'error') do
      'Oops. Something went wrong:'.html_safe +
      content_tag(:ul) do
        errors.full_messages.map { |message| content_tag(:li, message) }.join.html_safe
      end
    end
  end

  def venue_address
    '100+N+Atlantic+Ave+Daytona+Beach+FL+32118'
  end

  def maps_image_url
    options = { zoom: 11, size: '666x375', markers: venue_address }
    "https://maps.googleapis.com/maps/api/staticmap?#{options.to_query}"
  end

  def maps_url
    "https://www.google.com/maps/place/#{venue_address}"
  end
end
