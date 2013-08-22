require 'mandrill'

class HomeController < StaticContentController
  
  def index
    if is_crisis_mode
      redirect_to em_home_path
    else
      redirect_to home_path
    end
  end

  def home
  end

  def em_home
    @mode = Mode.all.first
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
  
  def is_crisis_mode
    Mode.first.em_mode
  end


end
