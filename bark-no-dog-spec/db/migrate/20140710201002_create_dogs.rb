class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.datetime :birthday
      t.string :city
      t.string :state
      t.boolean :newsletter
      t.attachment :avatar
      t.timestamps
    end
  end
end
