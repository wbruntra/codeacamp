class Answer < ActiveRecord::Base
  # Remember to create a migration!
  validates :body, :presence => true

  has_many :answer_votes
  belongs_to :question
  belongs_to :user

  def vote_total
    total = 0
    for vote in self.answer_votes do
      total += vote.value
    end
    return total
  end
end
