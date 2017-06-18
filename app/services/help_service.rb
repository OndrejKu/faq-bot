class HelpService
  def self.call
    response  = "*What I'm capable of :raised_hands:* \n\n"
    response += "*help*\n"
    response += ">List of commands\n\n"
    response += "*Add *\n"
    response += ">Add new question and answer to FAQ\n\n"
    response += "*Remove ID*\n"
    response += ">Remove a question from database based on ID\n\n"
    response += "*Find X*\n"
    response += ">Search the database based on word\n\n"
    response += "*Search a hashtag X*\n"
    response += ">Get list of questions and answers based on hashtag\n\n"
    response += "*FAQ*\n"
    response += ">Show all questions and answers\n\n"
  end
end