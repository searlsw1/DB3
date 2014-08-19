class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    render json: @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params(params[:user]))

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update(params[:user])
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    head :no_content
  end
  
  def user_params(params)
    params.permit(:email, :password, :name, :blurb)
  end

  #GET SHOW_FOLLOWS
  def show_follows
    @user = User.find(params[:id])
    render json: @user.follows
  end 	

  #GET SHOW_FOLLOWERS
  def show_followers
    @user = User.find(params[:id])
    render json: @user.followers
  end

  #POST ADD_FOLLOWS
  def add_follows
    @user = User.find(params[:id])
    @follows = User.find(params[:follows_id])

    #nav property - user.follows
    if @user.follows << @follows

      #204 No Content HTTP status 
      head :no_content

    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end	

  #POST DELETE_FOLLOWS
  def delete_follows
    @user = User.find(params[:id])
    @follows = User.find(params[:follows_id])

    if @user.follows.delete(@follows)

      #204 No Content HTTP status 
      head :no_content

    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  #SPLATTS
  def splatts
    @user = User.find(params[:id])
    render json: @user.splatts
  end 


  #FEED
  def feed
    @feed = Splatt.find_by_sql("SELECT splatts.body, splatts.user_id, splatts.id, splatts.created_at FROM splatts JOIN follows ON follows.followed_id=splatts.user_id WHERE follows.follower_id=#{params[:id]} ORDER BY created_at DESC")
    render json: @feed
  end

end
