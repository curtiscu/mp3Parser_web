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
    # @artists=Song.find(:all, :select => "artist", :group => "artist")
    # @users = User.paginate :page => params[:page], :order => 'name'
    @artists=Song.paginate :page => params[:page], :select => "artist", :group => "artist", :order => 'artist'
  end

end
