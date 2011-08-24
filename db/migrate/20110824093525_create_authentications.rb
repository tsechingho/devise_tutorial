class CreateAuthentications < ActiveRecord::Migration
  def self.up
    create_table :authentications do |t|
      t.references :resource, :polymorphic => true
      t.string :provider
      t.string :uid
      t.string :uname
      t.string :uemail

      t.timestamps
    end
  end

  def self.down
    drop_table :authentications
  end
end
