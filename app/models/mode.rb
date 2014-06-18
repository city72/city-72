class Mode < ActiveRecord::Base
	attr_accessible :title, :text, :em_mode

  def self.is_crisis_mode
    Mode.first.em_mode
  end

  def self.is_preview_mode
    Mode.first.em_mode
  end

end