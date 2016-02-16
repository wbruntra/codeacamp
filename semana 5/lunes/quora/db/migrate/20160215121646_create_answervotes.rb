class CreateAnswervotes < ActiveRecord::Migration
  def change
    create_table :answer_votes do |t|
        t.integer :user_id
        t.integer :answer_id
        t.integer :value
    end
  end
end
