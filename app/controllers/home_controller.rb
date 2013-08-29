require 'mandrill'

class HomeController < ApplicationController
  
  after_filter :dynamic_content, only: [:index, :em_home]
  after_filter :static_content, only: [:home, :connect, :about, :supplies, :quick_guide, :our_manifesto]

  before_filter :set_current_mode

  def index
    if CurrentMode.is_crisis_mode
      redirect_to em_home_path
    else
      redirect_to home_path
    end
  end

  def em_home
    @mode = CurrentMode.get_current_mode
    @citizen_feed = CitizenFeed.first
  end

  def about
    @render_captcha = MailHelper::posible_attack?
  end

  def supplies
    @essentials = Item.where(category: Categories::ESSENTIAL.to_s).order('items.order ASC')
    @useful = Item.where(category: Categories::USEFUL.to_s).order('items.order ASC')
    @personal = Item.where(category: Categories::PERSONAL.to_s).order('items.order ASC')
    @kits = Kit.all
  end

  empty_methods :home, :connect, :quick_guide, :our_manifesto

  private
  def set_current_mode
    @mode = CurrentMode.get_current_mode
    @preview = CurrentMode.is_preview_mode
  end

end
