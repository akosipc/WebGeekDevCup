class AddsHasAndBelongsToManyCategoriesAndLightbulbs < ActiveRecord::Migration
  def up
  	create_table :categories_lightbulbs, :id => false do |t|
  		t.references :category_id, :lightbulb_id
  	end
  end

  def down
  	drop_table :categories_lightbulbs
  end
end
