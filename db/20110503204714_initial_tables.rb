class InitialTables < ActiveRecord::Migration
  def self.up
    create_table :booking_requests do |t|
      t.string :name
      t.string :phone
      t.integer :end_user_id
      t.integer :adult_count, :default => 0
      t.integer :child_count, :default => 0
      t.date  :request_date
      t.integer :request_minutes
      t.text :comments
      t.timestamps
    end

    add_index :booking_requests, :end_user_id, :name => 'end_user_id'
  end

  def self.down
    drop_table :booking_requests
  end
end
