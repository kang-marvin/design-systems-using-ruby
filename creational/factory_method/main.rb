class NetflixSearch
  BASE_URL = "https://netflix.com/browse"

  def initialize; end

  def call
    puts "Searching all of Netflix"
    puts BASE_URL
  end

end

class DocumentariesSearch < NetflixSearch
  BASE_URL = "https://netflix.com/browse/genre/6839"

  def initialize; end

  def call
    puts "Searching documentaries genre"
    puts BASE_URL
  end
end

class ComediesSearch < NetflixSearch
  BASE_URL = "https://netflix.com/browse/genre/6548"

  def initialize; end

  def call
    puts "Searching comedies genre"
    puts BASE_URL
  end
end

class GenreSearchFactory
  NETFLIX_GENRE_CODES = {
    'comedies': ComediesSearch,
    'documentaries': DocumentariesSearch,
  }

  def self.call(genre)
    NETFLIX_GENRE_CODES.default = NetflixSearch
    (NETFLIX_GENRE_CODES[genre.to_sym]).new
  end
end

search_link_via_code = GenreSearchFactory.call(:comedies).call

puts search_link_via_code