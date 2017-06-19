require_relative './../../spec_helper.rb'

describe FaqModule::RemoveService do
  before do
    @company = create(:company)
  end

  describe '#call' do
    it "With valid ID, remove Faq" do
      faq = create(:faq, company: @company)
      @removeService = FaqModule::RemoveService.new({"id" => faq.id})
      response = @removeService.call()

      expect(response).to match("Successfully deleted")
    end

    it "With invalid ID, receive error message" do
      @removeService = FaqModule::RemoveService.new({"id" => rand(1..9999)})
      response = @removeService.call()

      expect(response).to match("Invalid question, please verify the ID")
    end
  end
end