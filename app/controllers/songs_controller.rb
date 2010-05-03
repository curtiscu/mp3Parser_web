class SongsController < ApplicationController

  RECORDS_PER_PAGE = 30
    
  def view

    @show_song = Song.find(params[:id])
    
  end

  def add
  end

  def index
    

    # the new paginated way
    @songs=Song.paginate :page => params[:page], :per_page => 50, :select => "*", :order => 'title'
    
  end

  def delete
  end

  def update
  end
  
  protected
  def my_layout
    if @empty_db
      "empty_db"
    else
      "not_empty_db"
    end
  end
  

end
