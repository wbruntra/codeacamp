class Post < ActiveRecord::Base
  # Remember to create a migration!
  validates :body, :presence => true
  validates :title, :presence => true

  has_many :connections
  has_many :tags, through: :connections
  
end
