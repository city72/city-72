class Connection < ActiveRecord::Base
  attr_accessible :facebook_page_url, :twitter_accounts_attributes

  has_many :twitter_accounts
  accepts_nested_attributes_for :twitter_accounts, allow_destroy: true

end
