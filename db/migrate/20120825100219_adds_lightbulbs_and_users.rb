class AddsLightbulbsAndUsers < ActiveRecord::Migration
  def up
  	drop_table :users_lightbulbs
  	create_table :lightbulbs_users, :id => false do |t|
  		t.references :lightbulb, :user
  	end
  end

  def down
  	drop_table :lightbulbs_users
  end
end
