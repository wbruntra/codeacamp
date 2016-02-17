class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :email
      t.string :username
      t.string :password_digest
    end
  end
end
