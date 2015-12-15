class Answer < ActiveRecord::Base
  belongs_to :question

  validates :body, presence: true, length: {minimum: 50}
end
