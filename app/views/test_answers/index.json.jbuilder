json.array!(@test_answers) do |test_answer|
  json.extract! test_answer, :id, :username
  json.url test_answer_url(test_answer, format: :json)
end
