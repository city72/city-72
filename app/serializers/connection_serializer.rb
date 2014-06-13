class ConnectionSerializer < ActiveModel::Serializer
  attributes :id, :facebook_page_url

  has_many :twitter_accounts
end
