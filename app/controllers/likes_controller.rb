class LikesController < ApplicationController
  
  
  def new
    @headline = Headline.find(params[:id])
    @like = Like.new
    @like.headline_id = @headline.first.id
    @like.user_id = current_user.id
    @like.tof = true
    
    
    respond_to do |format|
      if @like.save

        
        format.html {
          flash[:notice] = "Thanks for Blessing this Headline!" 
          redirect_to root_path }
      else
        format.html {
          flash[:notice] = "Oh my god - Something went wrong while blessing!"
          redirect_to root_path }
        
      end
    end
    
    
    
  end
  
  
  
  
  def lines_top_10
    @likes = Like.find(:all, :select => "headline_id, count(id) as like_count", :group => "headline_id", :order => "like_count DESC", :limit => 10)
  end
  
  

  
  
end
