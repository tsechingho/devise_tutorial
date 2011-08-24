class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.references :resource
      t.string :first_name
      t.string :last_name
      t.string :fullname
      t.string :nickname

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
