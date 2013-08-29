class CurrentMode < ActiveRecord::Base

  attr_accessible :mode

  CRISIS = true
  PREVIEW = !CRISIS

  def self.is_crisis_mode
    current_mode == CRISIS
  end

  def self.is_preview_mode
    current_mode == PREVIEW
  end

  def self.get_current_mode
  	Mode.where( em_mode: current_mode ).first
  end

  def self.toggle_mode
    if is_crisis_mode
      switch_to_preview_mode
    else
      switch_to_crisis_mode
    end
  end

  def self.switch_to_crisis_mode
    set_mode CRISIS
  end

  def self.switch_to_preview_mode
    set_mode PREVIEW
  end

  private
  def self.set_mode mode
    current_mode = CurrentMode.first
    current_mode.mode = mode
    current_mode.save
  end

  def self.current_mode
    CurrentMode.first.mode
  end

end
