module RetinaImageHelper

  def retina_image_tag image, width, height
    if image.respond_to? :retina
      "<img class=\"retina-img\" alt=\"#{image.retina.url}\" src=\"#{image.url}\" width=\"#{width}\" height=\"#{height}\" />".html_safe
    else
      "<img src=\"image.url\" width=\"#{width}\" height=\"#{height}\" />".html_safe
    end
  end
end