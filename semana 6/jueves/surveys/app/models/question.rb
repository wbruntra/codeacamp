class Question < ActiveRecord::Base
  # Remember to create a migration!
  validates :body, :presence => true

  has_many :choices

  belongs_to :survey

end
