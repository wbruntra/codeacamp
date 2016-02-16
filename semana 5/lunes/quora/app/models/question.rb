class Question < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, :presence => true

  has_many :question_votes
  has_many :answers
  belongs_to :user

  def vote_total
    total = 0
    for vote in self.question_votes do
      total += vote.value
    end
    return total
  end
end
