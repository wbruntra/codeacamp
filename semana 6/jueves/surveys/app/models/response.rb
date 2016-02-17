class Response < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question
  belongs_to :user
end
