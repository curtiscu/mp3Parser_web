class AlbumController < ApplicationController
  def view
    
    @album=params[:album]
    @songs=Song.find(:all, :conditions => {:album => @album} ) 
      
  end
    
    
  def index
  
  
    # the new paginated way
    @albums=Song.paginate :page => params[:page], :per_page => 50, :select => "album,artist", :group => "album", :order => 'album'
    
  end

end
