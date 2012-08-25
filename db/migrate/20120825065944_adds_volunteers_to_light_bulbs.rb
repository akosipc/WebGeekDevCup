class AddsVolunteersToLightBulbs < ActiveRecord::Migration
  def up
  	create_table :users_lightbulbs, :id => false do |t|
  		t.references :user_id, :lightbulb_id
  	end
  end

  def down
  	drop_table :users_lightbulbs
  end
end
