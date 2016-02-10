class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.string :postname
      t.string :tagname
    end
  end
end
