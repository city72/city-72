require 'mandrill'

class HomeController < StaticContentController
  
  def index
    if CurrentMode.isCrisisMode
      redirect_to em_home_path
    else
      redirect_to home_path
    end
  end

  def home
  end

  def em_home
    @mode = CurrentMode.getCurrentMode
    @citizen_feed = CitizenFeed.first
  end

  def connect
  end

  def prepare_landing
  end

  def about
    @render_captcha = MailHelper::posible_attack?
  end

  def prepare_people
  end

  def prepare_things
  end

  def supplies
    @items = Item.all
    @kits = Kit.all
  end

  def quick_guide
  end

  def our_manifesto
  end

  private
  
end
