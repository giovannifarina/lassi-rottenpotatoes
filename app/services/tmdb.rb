require "http"

class Tmdb

    def self.get_top20_popular_to_movies?
        # return an hash of the response received on the API api.themoviedb.org/3/movie/popular
        begin
            response = HTTP.timeout(3).get("https://api.themoviedb.org/3/movie/popular", :params => {:api_key => Rails.application.credentials[:tmdb][:api_key], :language => 'en-US', :page => '1'})
        rescue => e
            return false
        end
        results = response.parse['results']
        results.each do |r|
            m = Movie.new
            m.title = r['title']
            m.release_date = Date.parse(r['release_date'])
            m.description = r['overview']
            m.save!
        end
        return true
    end
end