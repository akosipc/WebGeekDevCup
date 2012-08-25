class CreateLightbulbs < ActiveRecord::Migration
  def change
    create_table :lightbulbs do |t|
    	t.integer :user_id
    	t.string :title
    	t.text :description
    	t.integer :target_participants
    	t.integer :current_participants
      t.timestamps
    end
  end
end
