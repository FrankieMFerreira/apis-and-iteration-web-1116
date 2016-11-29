require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
 #make the web request
 all_characters = RestClient.get('http://www.swapi.co/api/people/')
 character_hash = JSON.parse(all_characters)

   films_hash = []

   character_hash["results"].each do |element|
     if element["name"].downcase == character
         element["films"].each do |film|
           films_hash << JSON.parse(RestClient.get(film.to_s))
         end
     end
   end
films_hash
end



def parse_character_movies(films_hash)
   films_hash.each.with_index(1) do |movie, index|
     puts "#{index}. #{movie["title"]}"
     puts "Director: #{movie["director"]}"

   end
end

def show_character_movies(character)
 films_hash = get_character_movies_from_api(character)
 parse_character_movies(films_hash)
end
