class DeviseCreateManagers < ActiveRecord::Migration
  def self.up
    create_table(:managers) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :managers, :email,                :unique => true
    add_index :managers, :reset_password_token, :unique => true
    # add_index :managers, :confirmation_token,   :unique => true
    # add_index :managers, :unlock_token,         :unique => true
    # add_index :managers, :authentication_token, :unique => true
  end

  def self.down
    drop_table :managers
  end
end
