class RoundParticipationsController < ApplicationController
  before_action :set_round_participation, only: [:show, :edit, :update, :destroy]

  # GET /round_participations
  # GET /round_participations.json
  def index
    @round_participations = RoundParticipation.all
  end

  # GET /round_participations/1
  # GET /round_participations/1.json
  def show
  end

  # GET /round_participations/new
  def new
    @round_participation = RoundParticipation.new
  end

  # GET /round_participations/1/edit
  def edit
  end

  # POST /round_participations
  # POST /round_participations.json
  def create
    @round_participation.advanced_round = false
    @round_participation = RoundParticipation.new(round_participation_params)

    respond_to do |format|
      if @round_participation.save
        format.html { redirect_to @round_participation, notice: 'Round participation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @round_participation }
      else
        format.html { render action: 'new' }
        format.json { render json: @round_participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /round_participations/1
  # PATCH/PUT /round_participations/1.json
  def update
    respond_to do |format|
      if @round_participation.update(round_participation_params)
        format.html { redirect_to @round_participation, notice: 'Round participation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @round_participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /round_participations/1
  # DELETE /round_participations/1.json
  def destroy
    @round = @round_participation.round
    if(@round.round_no == 1)
      # delete round one, didn't participate in the tournament
      # just sign up but didnt get accepted
      @tourpar = TournamentParticipation.where
        (:tournament_id => @round.tournament.id, 
          :character_id => @round_participation.character_id)
      @tourpar.update_attribute :participated,false
    else
      # didnt advance to another round, reset the advanced
      @prevround = Round.where(:tournament_id => @round.tournament_id, 
        :round_no => (@round.round_no -1))
      @prevroundpar = RoundParticipation.where(:round_id => @prevround.id, 
        :character_id => round_participation.character_id)
      @prevroundpar.update_attribute :advanced_round,false
    end
    # note to self might add NPC later...

    @round_participation.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round_participation
      @round_participation = RoundParticipation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def round_participation_params
      params.require(:round_participation).permit(:round_id, :character_id, :point, :late_deduction)
    end
end
