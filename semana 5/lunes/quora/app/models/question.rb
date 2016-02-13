class Question < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, :presence => true

  has_many :answers
end
