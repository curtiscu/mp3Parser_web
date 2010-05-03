# Methods added to this helper will be available to all templates in the application.

require 'id3lib'
require 'pathname'
require 'find' 
require 'fileutils' 


module ApplicationHelper

  # Return a title on a per-page basis. 
  def title 
    
    base_title = "curtis' first ruby app" 
    if @title.nil? 
      base_title 
    else 
      "#{base_title} | #{@title}" 
    end 
  end 

  def process_mp3 (  mp3_file )
      
    tag = ID3Lib::Tag.new(mp3_file)
    
    if @options[:debug]
      # full dump of mp3 frame info from tag
      puts "\ndumping frames"
      tag.each do |frame|
           p frame
         end
    end
  
    # set vars to write to db
    t_path = mp3_file
    t_track = tag.track.nil? ? "" : tag.track
    t_title = tag.title.nil? ? "" : tag.title
    t_album = tag.album.nil? ? "" : tag.album
    t_artist = tag.artist.nil? ? "" : tag.artist
    t_genre = tag.genre.nil? ? "" : tag.genre
    
    # for some reason they thought it was a good idea 
    # to return genre like "(17)", i.e. inside '(' and ')'
    # parse out genre number
    if !t_genre.empty?
      genreNumber =  t_genre.scan(/\d+/) 
      t_genre = ID3Lib::Info::Genres[genreNumber[0].to_i]
    end
    
    if @options[:debug]
      # debug dump ID3 tag info to display.
      puts "track #: " + t_track 
      puts "title: " + t_title
      puts "album: " + t_album
      puts "artist: " + t_artist
      puts "genre: " + t_genre
      puts "path: " + t_path
    end
    
    if @options[:do_nothing]
      puts "adding (not): " + mp3_file  if @options[:verbose]
    else
      puts "adding: " + mp3_file if @options[:verbose]
      Song.create(:artist => t_artist, 
        :album => t_album, 
        :title => t_title, 
        :track => t_track, 
        :genre => t_genre,
        :path => t_path)
    end
    
    @mp3_count += 1
    
  end
  
  
end

