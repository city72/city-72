class About < ActiveRecord::Base
  attr_accessible :brought_to_you_by

  validates :brought_to_you_by, presence: true
end
