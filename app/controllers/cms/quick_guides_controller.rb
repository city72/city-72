class Cms::QuickGuidesController < BackOfficeController

  def show
    @quick_guide = QuickGuide.where("custom").first
  end

  def update

  end

end