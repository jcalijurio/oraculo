class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
  belongs_to :best_answer, :class_name => "Answer", :foreign_key => "best_answer_id"

  validates_presence_of :title, :body,:owner
  validates_associated :owner
end

