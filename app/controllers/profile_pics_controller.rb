class ProfilePicsController < ApplicationController
  before_action :set_profile_pic, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show, :index]

  # GET /profile_pics
  # GET /profile_pics.json
  def index
    @profile_pics = ProfilePic.all
  end

  # GET /profile_pics/1
  # GET /profile_pics/1.json
  def show
  end

  # GET /profile_pics/new
  def new
    @profile_pic = ProfilePic.new
  end

  # GET /profile_pics/1/edit
  def edit
  end

  # POST /profile_pics
  # POST /profile_pics.json
  def create
    @profile_pic = ProfilePic.new(profile_pic_params)
    @profile_pic.user_id = current_user.id

    respond_to do |format|
      if @profile_pic.save
        format.html { redirect_to @profile_pic, notice: 'Profile pic was successfully created.' }
        format.json { render action: 'show', status: :created, location: @profile_pic }
      else
        format.html { render action: 'new' }
        format.json { render json: @profile_pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile_pics/1
  # PATCH/PUT /profile_pics/1.json
  def update
    respond_to do |format|
      if @profile_pic.update(profile_pic_params)
        format.html { redirect_to @profile_pic, notice: 'Profile pic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile_pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_pics/1
  # DELETE /profile_pics/1.json
  def destroy
    @profile_pic.destroy
    respond_to do |format|
      format.html { redirect_to profile_pics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_pic
      @profile_pic = ProfilePic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_pic_params
      params.require(:profile_pic).permit(:user_id, :avatar)
    end
end
