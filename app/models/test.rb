class Test < ActiveRecord::Base
  has_many :metrics
  has_many :test_answers
end
