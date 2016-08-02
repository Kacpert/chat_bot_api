class Message::Parser
  attr_reader :question_from_params, :any_to_learn
  
  def initialize(message)
    @question_from_params = message
    @any_to_learn = message.match /^`(.*?)` {0,2}`(.*?)`$/
  end

  def question_to_learn 
    @any_to_learn[1]
  end

  def answer_to_learn
    @any_to_learn[2]
  end
end