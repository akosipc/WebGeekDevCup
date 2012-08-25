class AddDateInLightbulb < ActiveRecord::Migration
  def up
  	add_column :lightbulbs, :end_date, :date
  end

  def down
  	remove_column :lightbulbs, :end_date
  end
end
