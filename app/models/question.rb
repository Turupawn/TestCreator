class Question < ActiveRecord::Base
  belongs_to :metric
  has_many :answers
end
