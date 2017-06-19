class InterpretService
  def self.call action, params
    case action
    when "list", "search", "search_by_hashtag"
      FaqModule::ListService.new(params, action).call()
    when "create"
      FaqModule::CreateService.new(params).call()
    when "remove"
      FaqModule::RemoveService.new(params).call()
    when "link_list", "link_search", "link_search_by_hashtag"
      LinkModule::ListService.new(params, action).call
    when "link_create"
      LinkModule::CreateService.new(params).call
    when "link_remove"
      LinkModule::RemoveService.new(params).call
    when "help"
      HelpService.call()
    else
      "I didn't understand what you want"
    end
  end
end