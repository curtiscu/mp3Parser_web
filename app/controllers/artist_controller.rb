class ArtistController < ApplicationController

  def view
  
    @artist=params[:artist]
    @songs=Song.find(:all, :conditions => {:artist => @artist})
    @albums=Song.find(:all, :conditions => {:artist => @artist}, :group => "album")   
    
    # TODO - for @albums query, return count of songs per album in result
    
  end

  def update
  end
  
  def index
    @artists=Song.find(:all, :select => "artist", :group => "artist")
  end

end
