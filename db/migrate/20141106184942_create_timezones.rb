class CreateTimezones < ActiveRecord::Migration
  def change
    create_table :timezones do |t|
      t.string :time_zone
      t.belongs_to :user, index: true
      
      t.timestamps
    end
  end
end
