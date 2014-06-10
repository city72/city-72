class Affiliate < ActiveRecord::Base
  attr_accessible :name, :url
  belongs_to :city

  validates :name, :url, presence: true
end
