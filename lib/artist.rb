require 'pry'

class Artist
	attr_accessor :name, :songs

	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def add_song(song)
		@songs << song
	end

	def save
		@@all << self
	end

	def self.all
		@@all
	end

	def self.find_or_create_by_name(name)
		if self.all.any?{|artist| artist.name == name}
			self.all.find {|artist| artist.name == name}
		else
			new_artist = self.new(name)
			new_artist.save
			new_artist
		end
	end

	def print_songs
		@songs.each {|song| puts song.name}
	end
end