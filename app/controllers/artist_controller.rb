class ArtistController < CurtisAppController

  def view
  
    @artist=params[:artist]
    @songs=Song.find(:all, :conditions => {:artist => @artist})
    @albums=Song.find(:all, :conditions => {:artist => @artist}, :group => "album")   
    
    # TODO - for @albums query, return count of songs per album in result
    
  end

  def update
  end
  
  def index
  
    # the old way
    # @artists=Song.find(:all, :select => "artist", :group => "artist")
    
    # the new paginated way
    @artists=Song.paginate :page => params[:page], :per_page => 50, :select => "artist", :group => "artist", :order => 'artist'
    
  end

end
