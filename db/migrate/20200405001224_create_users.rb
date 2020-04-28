class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :email
      t.text :password_digest
      t.integer :role

      t.timestamps
    end
  end
end
