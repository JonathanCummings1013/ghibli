class API 
  def self.get_data 
     response = RestClient.get("https://ghibliapi.herokuapp.com/films")
     films_list = JSON.parse(response)

     films_list.each do |films|

      Movies.new(films["title"])
      # binding.pry
     end
   
      binding.pry
  end
  end


