module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "#{@city.abbreviation}72"
    if page_title.empty?
      base_title
    else
      "#{base_title} - #{page_title}"
    end
  end

  def city_residents
    @city.moniker.blank? ? "#{@city.name} residents" : @city.moniker
  end
  
end
