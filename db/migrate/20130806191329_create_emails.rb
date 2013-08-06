class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :from_email
      t.string :from_name
      t.string :subject
      t.text :html_message
      t.boolean :preserve_recipients

      t.timestamps
    end
  end
end
