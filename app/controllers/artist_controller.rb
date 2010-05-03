class ArtistController < CurtisAppController

  def view
  
    # shows details on one specific artist
  
    @artist=params[:artist]
    @songs=Song.find(:all, :conditions => {:artist => @artist}, :order => "album,track")
    @albums=Song.find(:all, :conditions => {:artist => @artist}, :group => "album")   
    
    # TODO - for @albums query, return count of songs per album in result
    
  end

  def update
  end
  
  def index
  
    # shows paginated index of all artists in the DB
    
    @artists=Song.paginate :page => params[:page], :per_page => 50, :select => "artist", :group => "artist", :order => 'artist'
    
  end

end
