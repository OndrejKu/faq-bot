require_relative './../../spec_helper.rb'

describe LinkModule::CreateService do 
  before do 
    @company = create(:company)

    @url = FFaker::Internet.http_url
    @description = FFaker::Lorem.phrase
    @hashtags = "#{FFaker::Lorem.word}, #{FFaker::Lorem.word}"
  end

  describe '#call' do 
    it "Without hashtag params, will receive an error" do 
      @createService = LinkModule::CreateService.new({
        "url-original" => @url, 
        "description-original" => @description
        })

      response = @createService.call
      expect(response).to match("Please fill out the hashtag")
    end

    it "With valid params, receive success message" do
      @createService = LinkModule::CreateService.new({
        "url-original" => @url, 
        "description-original" => @description, 
        "hashtags-original" => @hashtags
        })

      response = @createService.call
      expect(response).to match("Created with success")
    end

    it "With valid params, find url and description in database" do
      @createService = LinkModule::CreateService.new({
        "url-original" => @url, 
        "description-original" => @description, 
        "hashtags-original" => @hashtags
        })
      response = @createService.call
      expect(Link.last.url).to match(@url)
      expect(Link.last.description).to match(@description)
    end

    it "With valid params, hashtags are created" do 
      @createService = LinkModule::CreateService.new({
        "url-original" => @url, 
        "description-original" => @description, 
        "hashtags-original" => @hashtags
        })
      response = @createService.call
      expect(@hashtags.split(/[\s,]+/).first).to match(Hashtag.first.name)
      expect(@hashtags.split(/[\s,]+/).last).to match(Hashtag.last.name)
    end
  end
end