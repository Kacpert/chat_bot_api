require 'rails_helper'

RSpec.describe Message::Parser do
  describe 'Object message' do
    context 'when initialize string fits to learning regex' do
      subject { Message::Parser.new("`i am` `to learn`") }

      it '#question_from_params' do
        expect(question_from_params).to eq("`i am` `to learn`")
      end

      it '#any_to_learn' do
        expect(any_to_learn).to eq("`i am` `to learn`".match /^`(.*?)` {0,2}`(.*?)`$/)
        expect(any_to_learn.present).to eq(true)
      end

      it '#question_to_learn' do
        expect(question_to_learn).to eq("i am")
      end

      it '#answer_to_learn' do
        expect(answer_to_learn).to eq("to learn")
      end
    end

  end
end
