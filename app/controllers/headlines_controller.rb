class HeadlinesController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :require_username
  
  
  # GET /headlines
  # GET /headlines.json
  def index
    @search = Headline.search(params[:q])
    @search.build_condition
    @headlines = @search.result.order('created_at DESC').paginate(:per_page => 15, :page => params[:page])
    
    @heads_count = Headline.all.count

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @headlines }
    end
  end

  # GET /headlines/1
  # GET /headlines/1.json
  def show
    @headline = Headline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @headline }
    end
  end

  # GET /headlines/new
  # GET /headlines/new.json
  def new
    @mycategories = Category.all
    @mytypes = Type.all
    @headline = Headline.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @headline }
    end
  end

  # GET /headlines/1/edit
  def edit
    @mycategories = Category.all
    @mytypes = Type.all
    
      @headline = Headline.find(params[:id])
  
  end

  # POST /headlines
  # POST /headlines.json
  def create
    @mycategories = Category.all
    @mytypes = Type.all
    @headline = Headline.new(params[:headline])
    @headline.user_id = current_user.id
    @head_temp = @headline

    respond_to do |format|
      if @headline.save
        
        
        @headline = Headline.new
        @headline.category = @head_temp.category
        @headline.type = @head_temp.type
        @headline.client = @head_temp.client
        @headline.tags = @head_temp.tags
        
        
        format.html {
          flash[:notice] = 'Headline "' + @head_temp.head[0...30] + '..." sucessfully created – Write another one:'   
          render :new }
        format.json { render json: @headline, status: :created, location: @headline }
      else
        format.html { render action: "new" }
        format.json { render json: @headline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /headlines/1
  # PUT /headlines/1.json
  def update
    @mycategories = Category.all
    @mytypes = Type.all
    @headline = Headline.find(params[:id])
    

    respond_to do |format|
      if @headline.update_attributes(params[:headline])
        format.html { redirect_to mylines_path, notice: 'Headline was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @headline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /headlines/1
  # DELETE /headlines/1.json
  def destroy
    @headline = Headline.find(params[:id])
    @headline.destroy

    respond_to do |format|
      format.html { redirect_to headlines_url }
      format.json { head :no_content }
    end
  end
  

  
  def mylines
    @headlines = Headline.where("user_id = ?", current_user).paginate(:per_page => 10, :page => params[:page])
  
  
    
  end
  
  def lines_by_user
    @headlines = Headline.where("user_id =?", params[:id]).paginate(:per_page => 10, :page => params[:page])
  end
  

  def lines_by_client
    @headlines = Headline.where("client_id = ?", params[:client]).paginate(:per_page => 10, :page => params[:page])
  end

  
    def users_top_10
      @headlines = Headline.find(:all, :select => "user_id, count(id) as headlines_count", :group => "user_id", :order => "headlines_count DESC", :limit => 10)
    end
  
  

  def require_username
    unless current_user.profile
      redirect_to new_profile_path
    end
  end
  
  
  
  
end
