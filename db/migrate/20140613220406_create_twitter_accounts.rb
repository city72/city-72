class CreateTwitterAccounts < ActiveRecord::Migration
  def change
    create_table :twitter_accounts do |t|
      t.integer :connection_id
      t.string :username

      t.timestamps
    end
  end
end
