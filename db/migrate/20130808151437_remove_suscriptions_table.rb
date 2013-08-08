class RemoveSuscriptionsTable < ActiveRecord::Migration
  def change
  	drop_table :suscriptions
  end
end
