class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :post_id
      t.integer :tag_id
    end
  end
end
