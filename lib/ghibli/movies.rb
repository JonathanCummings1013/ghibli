class Movies
    attr_accessor :title
    # , :original_title, :description, :producer, :release_date, :running_time
   
    @@all = []

    def initialize(title)
        @title = title
    
        # films_hash.each do |key, value|
        #     self.send("#{key}=", value) if self.respond_to?("#{key}=")
        # end
        save 
    end

    def save 
        @@all << self
    end

    def self.all
        @@all
    end
    # # def self.find_by_selection(films_title)
    # #     self.all.detect do |movie|
    # #         films.title == films_title
    # #     end
    # end
end