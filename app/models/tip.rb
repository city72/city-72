class Tip < ActiveRecord::Base
  attr_accessible :title, :description, :moment_type_cd, :moment_type

  belongs_to :quick_guide
  as_enum :moment_type, before: 0, after: 1

  scope :before, -> { where(moment_type_cd: 0) }
  scope :after, -> { where(moment_type_cd: 1) }
end
