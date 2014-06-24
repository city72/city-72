require 'mandrill'

class HomeController < ApplicationController

  after_filter :dynamic_content, only: [:index, :em_home]
  after_filter :static_content, only: [:home, :connect, :about, :supplies, :quick_guide, :our_manifesto]
  before_filter :agency

  def index
    @crisis_mode = Mode.is_crisis_mode
  end

  def em_home
    @emergency_data = EmergencyData.first
  end

  def about
    @render_captcha = MailHelper::posible_attack?
  end

  def connect
    @city = City.first
    @city_connection = CityConnection.first
  end

  def plan
    @city = City.first
    @plan = @city.plan
    @quick_guide = @plan.quick_guide
  end

  def quick_guide
    @quick_guide = QuickGuide.first
  end

  def supplies
    @essentials = Item.where(category: Categories::ESSENTIAL.to_s).order('items.order ASC')
    @useful = Item.where(category: Categories::USEFUL.to_s).order('items.order ASC')
    @personal = Item.where(category: Categories::PERSONAL.to_s).order('items.order ASC')
    @kits = Kit.order(:id).all
  end

  empty_methods :home, :our_manifesto

  private
    def agency
      @city = City.first
      @agency_url = @city.agency_url
      @agency_site = @city.agency_site
    end

end
