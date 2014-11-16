class SplattsController < ApplicationController
before_filter :set_headers

  # GET /splatts
  # GET /splatts.json
  def index
    @splatts = Splatt.all

    render json: @splatts
  end

  # GET /splatts/1
  # GET /splatts/1.json
  def show
    @splatt = Splatt.find(params[:id])

    render json: @splatt
  end

  # POST /splatts
  # POST /splatts.json
  def create
    @user = User.find(params[:user_id])
	splatt = Splatt.new({:body => params[:body]})
	if @user.splatts.push(splatt)
		render json: splatt, status: :created, location: @user
	else
		render json: @user.errors, status: :unprocessable_entity
	end
  end


  # DELETE /splatts/1
  # DELETE /splatts/1.json
  def destroy
    @splatt = Splatt.find(params[:id])
    @splatt.destroy

    head :no_content
  end

 # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update(user_params(params))
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  #The permit method returns a copy of the parameters object, returning
  #only the permitted keys and values. So when creating a new ActiveRecord model, 
  #only the permitted attributes are passed into the model.
  def splatts_params(params)
    params.permit(:body, :user_id)
  end
end
