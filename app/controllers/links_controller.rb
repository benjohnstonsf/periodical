class LinksController < ApplicationController
  respond_to :html, :xml, :json, :js
  def new
    if user_signed_in?
      @link = Link.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    if user_signed_in?
      @link = current_user.links.build(params[:link])
      if @link.valid?
        @link.save
        respond_to do |format|
          # format.html { render action: "new" }
          format.js { render :template => 'links/create.js.erb', :layout => false }
        end
      else
        respond_to do |format|
          format.html {render action: "new"}
          format.json {render json: @link.errors,
                      status: unprocessable_entity}
        end
      end
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.delete
    redirect_to user_path(current_user)
  end
  
  def edit
    @link = Link.find(params[:id])
  end
  
  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(params[:link])
      flash[:success] = "Edited the link"
      redirect_to user_path(current_user)
    else
      render 'edit'
      flash[:error] = "Can't edit that way..."
    end
  end
end