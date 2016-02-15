class Answer < ActiveRecord::Base
  # Remember to create a migration!
  validates :body, :presence => true

  belongs_to :question
  belongs_to :user
end
