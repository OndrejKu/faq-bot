module LinkModule
  class ListService
    def initialize(params, action)
      # TODO: identify origin and set company
      @company = Company.last
      @action = action
      @query = params["query"]
    end

    def call
      if @action == "link_search"
        links = Link.search(@query).where(company: @company)
      elsif @action == "link_search_by_hashtag"
        links = []
        @company.links.each do |link|
          link.hashtags.each do |hashtag|
            links << link if hashtag.name == @query
          end
        end
      else
        links = @company.links
      end

      response = "*Saved Links* \n\n"
      links.each do |l|
        response += "*#{l.id}* - "
        response += "*#{l.url}*\n"
        response += ">#{l.description}\n"
        l.hashtags.each do |h|
          response += "_##{h.name}_ "
        end
        response += "\n\n"
      end
      (links.count > 0)? response : "Nothing found"
    end
  end
end