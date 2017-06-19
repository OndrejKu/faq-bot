module LinkModule
  class CreateService
    def initialize(params)
      @company = Company.last
      @url = params["url-original"]
      @description = params["description-original"]
      @hashtags = params["hashtags-original"]
    end

    def call
      if @hashtags == nil || @hashtags == ""
        return "Please fill out the hashtag"
      end

      begin
        Link.transaction do
          link = Link.create(url: @url, description: @description, company: @company)
          @hashtags.split(/[\s,]+/).each do |hashtag|
            link.hashtags << Hashtag.create(name: hashtag)
          end
        end
        "Created with success"
      rescue
        "Problemas found during the creation"
      end
    end
  end
end