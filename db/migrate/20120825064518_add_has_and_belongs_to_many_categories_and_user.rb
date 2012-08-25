class AddHasAndBelongsToManyCategoriesAndUser < ActiveRecord::Migration
  def up
  	create_table :categories_users, :id => false do |t|
  		t.references :category, :user
  	end
  end

  def down
  	drop_table :categories_users
  end
end
