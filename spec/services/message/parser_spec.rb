require 'rails_helper'

RSpec.describe Message::Parser do
  context 'When initializing string fits to learning regex' do
    describe 'returned object should responding to' do
      subject { Message::Parser.new("`i am` `to learn`") }

      it '#question_from_params' do
        expect(subject.question_from_params).to eq("`i am` `to learn`")
      end

      it '#any_to_learn' do
        expect(subject.any_to_learn).to eq("`i am` `to learn`".match /^`(.*?)` {0,2}`(.*?)`$/)
        expect(subject.any_to_learn.present?).to eq(true)
      end

      it '#question_to_learn' do
        expect(subject.question_to_learn).to eq("i am")
      end

      it '#answer_to_learn' do
        expect(subject.answer_to_learn).to eq("to learn")
      end
    end

  end
end
