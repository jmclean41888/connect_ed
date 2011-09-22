class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.text :about_me
      t.string :industry
      t.string :ethnicity
      t.string :age
      t.string :gender
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
