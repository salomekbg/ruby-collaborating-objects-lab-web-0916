require 'pry'

class MP3Importer
	attr_accessor :path

	def initialize(path)
		@path = path
		@all = []
	end

	def files
		@all << Dir[path << "/*mp3"]
		@all.flatten.map {|file| File.basename(file)}
	end

	def import
		files.map {|file| Song.new_by_filename(file)}
	end
end