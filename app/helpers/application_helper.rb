module ApplicationHelper
  def full_title(page_title)
    (page_title.presence || '2016 Gaming Tournament') + ' | Melvin'
  end

  def generate_form_errors(errors)
    return unless errors.present?
    content_tag(:div, class: 'ui error message') do
      content_tag(:div, 'Oops. Something went wrong:', class: 'header') +
      errors.full_messages.map { |message| content_tag(:div, message) }.join.html_safe
    end
  end

  def venue_address
    '100+N+Atlantic+Ave+Daytona+Beach+FL+32118'
  end

  def maps_image_url
    options = { zoom: 9, size: '675x359', markers: venue_address }
    "https://maps.googleapis.com/maps/api/staticmap?#{options.to_query}"
  end

  def maps_url
    "https://www.google.com/maps/place/#{venue_address}"
  end

  def hotel_url
    'http://www3.hilton.com/en/hotels/florida/'\
      'hilton-daytona-beach-resort-ocean-walk-village-DABDHHF/index.html'
  end

  def hotel_image_url
    'http://www3.hilton.com/resources/media/hi/DABDHHF/en_US/img/shared/'\
      'full_page_image_gallery/main/HH_exteriorsky_675x359_FitToBoxSmallDimension_Center.jpg'
  end
end
