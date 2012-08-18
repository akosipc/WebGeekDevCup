class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fname
      t.string :lname
      t.string :gender

      t.timestamps
    end
  end
end
