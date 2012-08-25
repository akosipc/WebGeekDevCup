class FixManyToManyRelationshipForUsersCategoriesLightbulbs < ActiveRecord::Migration
  def up
  	drop_table :categories_lightbulbs
  	drop_table :users_lightbulbs

  	create_table :categories_lightbulbs do |t|
  		t.references :category, :lightbulb
  	end

  	create_table :users_lightbulbs do |t|
  		t.references :user, :lightbulb
  	end
  end

  def down
  	drop_table :categories_lightbulbs
  	drop_table :users_lightbulbs
  end
end
