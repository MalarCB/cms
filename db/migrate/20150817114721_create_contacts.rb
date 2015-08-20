class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :message
      t.string :city
      t.string :state
      t.string :country
      t.string :ipaddress
      t.boolean :status

      t.timestamps null: false
    end
  end
end
