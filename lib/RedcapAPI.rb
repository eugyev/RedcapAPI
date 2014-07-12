require "RedcapAPI/version"

module RedcapAPI
  def new(token, url)
    @url = url
    @token = token
  end
  
  def get(study_id = nil)
    
  end
  
  
end
