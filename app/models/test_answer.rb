class TestAnswer < ActiveRecord::Base
  belongs_to :test
  has_many :answers
end
