class MessagesController < ApplicationController

  def create
    message_parser = Message::Parser.new(params[:message])
    if message_parser.any_to_learn.present?
      render json: Message.create(question: message_parser.question_to_learn,
                                  answer:   message_parser.answer_to_learn)
    else
      render json: {answer: Message.find_by(question: message_parser.question_from_params).answer}
    end
  end

end
