require_relative './../../spec_helper.rb'

describe LinkModule::RemoveService do
  before do
    @company = create(:company)
  end

  describe '#call' do
    it "With valid ID, remove Link" do
      link = create(:link, company: @company)
      @removeService = LinkModule::RemoveService.new({"id" => link.id})
      response = @removeService.call()

      expect(response).to match("Successfully deleted")
    end

    it "With invalid ID, receive error message" do
      @removeService = LinkModule::RemoveService.new({"id" => rand(1..9999)})
      response = @removeService.call()

      expect(response).to match("Invalid question, please verify the ID")
    end
  end
end