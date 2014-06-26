class QuickGuide < ActiveRecord::Base
  attr_accessible :title, :tips_attributes, :custom

  has_many :tips,  :order => 'moment_type_cd,id ASC'
  accepts_nested_attributes_for :tips, allow_destroy: true

  def before_tips
    tips.before
  end

  def during_tips
    tips.during
  end

  def after_tips
    tips.after
  end
end
