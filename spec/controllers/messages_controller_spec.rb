require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  describe 'POST #create' do
    it 'should learn text that fits to pattern: `text` `text`' do
      post :create, message: "`i am` `to learn`"
      expect(JSON.parse(response.body)["answer"]).to eq("to learn")
    end

    it 'should find answer when text don`t fits to pattern: `text` `text`' do
      answer = double(question: "What is your name?", answer: 'Me API')
      allow(Message).to receive(:find_by).and_return(answer)
      post :create, message: "What is your name?"

      expect(Message).to have_received(:find_by).with(question: "What is your name?")
      expect(JSON.parse(response.body)["answer"]).to eq("Me API")
    end
  end

end
