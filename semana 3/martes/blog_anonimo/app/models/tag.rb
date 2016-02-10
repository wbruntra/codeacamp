class Tag < ActiveRecord::Base
  # Remember to create a migration!
  has_many :connections
  has_many :posts, through: :connections
end
