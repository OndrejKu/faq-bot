module LinkModule 
  class RemoveService
    def initialize(params)
      @company = Company.last
      @params = params
      @id = params["id"]
    end

    def call
      link = @company.links.where(id: @id).last
      return "Invalid question, please verify the ID" if link == nil
      
      Link.transaction do
        # Deleta as tags associadas que não estejam associadas a outros links
        link.hashtags.each do |h|
          if h.links.count <= 1
            h.delete
          end
        end
        link.delete
        "Successfully deleted"
      end
    end
  end
end