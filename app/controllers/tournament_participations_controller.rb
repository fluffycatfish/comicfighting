class TournamentParticipationsController < ApplicationController
  before_action :set_tournament_participation, only: [:show, :edit, :update, :destroy]

  # GET /tournament_participations
  # GET /tournament_participations.json
  def index
    @tournament_participations = TournamentParticipation.all
  end

  # GET /tournament_participations/1
  # GET /tournament_participations/1.json
  def show
  end

  # GET /tournament_participations/new
  def new
    if user_signed_in?
      @characters = current_user.characters
    end

    @tournament_participation = TournamentParticipation.new
    @tournament = Tournament.find(params[:tournament_id])
  end

  # GET /tournament_participations/1/edit
  def edit
  end

  # POST /tournament_participations
  # POST /tournament_participations.json
  def create
    @tournament_participation = TournamentParticipation.new(tournament_participation_params)
    @tournament_participation.participated = false

    respond_to do |format|
      if @tournament_participation.save
        format.html { redirect_to :back, notice: 'Tournament participation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tournament_participation }
      else
        format.html { render action: 'new' }
        format.json { render json: @tournament_participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournament_participations/1
  # PATCH/PUT /tournament_participations/1.json
  def update
    respond_to do |format|
      if @tournament_participation.update(tournament_participation_params)
        format.html { redirect_to @tournament_participation, notice: 'Tournament participation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tournament_participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournament_participations/1
  # DELETE /tournament_participations/1.json
  def destroy
    @tournament_participation.destroy
    respond_to do |format|
      format.html { redirect_to tournament_participations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament_participation
      @tournament_participation = TournamentParticipation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_participation_params
      params.require(:tournament_participation).permit(:character_id, :tournament_id)
    end
end
