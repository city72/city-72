class AddCommunityImageToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :community_image, :string
  end
end
