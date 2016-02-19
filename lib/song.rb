class Song
  attr_accessor :name, :artist, :genre
  
  @@count = 0
  @@artists = []
  @@genres = []
  
  
  def initialize(name, artist, genre)
    @@count += 1
    @@artists << artist
    @@genres << genre
    @name = name
    @artist = artist
    @genre = genre
  end
  
  class << self
    def count
      @@count
    end
    
    def artists
      @@artists.uniq
    end
    
    def genres
      @@genres.uniq
    end
    
    def genre_count
      genre_histogram = Hash.new
      
      iterate_histogram(@@genres, genre_histogram)
      genre_histogram
    end
    
    def artist_count
      artist_histogram = Hash.new
      
      iterate_histogram(@@artists, artist_histogram)
      artist_histogram
    end
    
    def add_to_histogram(hash, key)
      hash[key] == nil ? hash[key] = 1 : hash[key] += 1
    end
    
    def iterate_histogram(array, histogram)
      array.each { |i| add_to_histogram(histogram, i) }
    end    
    
    protected :add_to_histogram, :iterate_histogram
  end
  
end