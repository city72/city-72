class CurrentMode < ActiveRecord::Base

  attr_accessible :mode

  CRISIS = true
  PREVIEW = !CRISIS

  def self.isCrisisMode
    currentMode == CRISIS
  end

  def self.isPreviewMode
    currentMode == PREVIEW
  end

  def self.getCurrentMode
  	Mode.where( em_mode: currentMode ).first
  end

  def self.toggleMode
    if isCrisisMode
      switchToPreviewMode
    else
      switchToCrisisMode
    end
  end

  def self.switchToCrisisMode
    setMode CRISIS
  end

  def self.switchToPreviewMode
    setMode PREVIEW
  end

  private
  def self.setMode mode
    current_mode = CurrentMode.first
    current_mode.mode = mode
    current_mode.save
  end

  def self.currentMode
    CurrentMode.first.mode
  end

end
