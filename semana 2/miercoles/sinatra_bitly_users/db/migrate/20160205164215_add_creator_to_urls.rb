class AddCreatorToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :creator, :string, default: 'Anonymous'
  end
end
