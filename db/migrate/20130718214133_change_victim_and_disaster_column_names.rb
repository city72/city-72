class ChangeVictimAndDisasterColumnNames < ActiveRecord::Migration
  def change
    rename_column :stories, :victim, :person
    rename_column :stories, :disaster, :event
  end
end
