class TwitterAccount < ActiveRecord::Base
  attr_accessible :username

  belongs_to :connection

end
