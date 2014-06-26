class Tip < ActiveRecord::Base
  attr_accessible :title, :description, :moment_type_cd, :moment_type

  validate :title, :description, presence: true

  belongs_to :quick_guide
  as_enum :moment_type, before: 0, during: 1, after: 2

  scope :before, -> { where(moment_type_cd: 0).order("id ASC") }
  scope :during, -> { where(moment_type_cd: 1).order("id ASC") }
  scope :after, -> { where(moment_type_cd: 2).order("id ASC") }
end
