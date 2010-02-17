class SongsController < ApplicationController

  RECORDS_PER_PAGE = 15
    
  def view
    @show_song = params[:id].nil? ? "no song" : Song.find(params[:id]).title

  end

  def add
  end

  def index
  
    @page_to_render = params[:pg].nil? ? 0: params[:pg].to_i
    
    if @page_to_render < 1
        redirect_to  :action => "index", :pg => 1 
    else
      @table_count = Song.count # do this to save multiple lookups of Song.count   
      record_to_render = (@page_to_render - 1) * RECORDS_PER_PAGE
      @songs = Song.find(:all, :offset => record_to_render, :limit => RECORDS_PER_PAGE)
      
      if @songs.empty? # either empty DB, or ran past end of records
        if @table_count > 0 # we've just run past end of records to display
          @page_to_render = @table_count/RECORDS_PER_PAGE
          @page_to_render += 1 if @table_count % RECORDS_PER_PAGE > 0
          redirect_to  :action => "index", :pg => @page_to_render
        else 
          #show some page for empty DB, or something
          render :layout =>"empty_db"
        end
      end

    end 
    

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
