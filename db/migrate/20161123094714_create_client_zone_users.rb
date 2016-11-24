class CreateClientZoneUsers < ActiveRecord::Migration
  def change
    create_table :client_zone_users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :auth_token, null: false
      t.boolean :active, null: true, default: true

      t.timestamps null: false
    end
  end
end
