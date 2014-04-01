class RoundsController < ApplicationController
  before_action :set_round, only: [:show, :edit, :update, :destroy]

  def allow_participation_round
    # allow character to participate in the next round
    @round = Round.find(params[:id])
    @prevroundpar = RoundParticipation.find(params[:round_participation_id])
    @prevroundpar.update_attribute :advanced_round,true

    @round_parti = RoundParticipation.new
    @round_parti.character_id = @prevroundpar.character_id
    @round_parti.round_id = @round.id
    @round_parti.save
      
    end
    redirect_to :back
  end

  def allow_participation_tournament
    # allow character to participate in tournament
    @tourpar = TournamentParticipation.find(params[:tournament_participation_id])
    @tourpar.update_attribute :participated, true

    @round_parti = RoundParticipation.new
    @round_parti.character_id = @tourpar.character_id
    @round_parti.round_id = params[:id]
    @round_parti.save

    redirect_to :back
  end
  # GET /rounds
  # GET /rounds.json
  def index
    @rounds = Round.all
  end

  # GET /rounds/1
  # GET /rounds/1.json
  def show
    @battles = @round.battles
    
    if current_user.try(:admin?)
      if @round.round_no == 1
        # first round use tournament participation
        # choose from registered tournament participation
        @tournamentpars = @round.tournament.tournament_participations
      else
        # rounds later than the first round
        # select from previous round
        @rounds = @round.tournament.rounds
        @rounds.each do |round|
          if round.round_no == (@round.round_no - 1)
            @lastroundpars = round.round_participations
          end
        end
      end
    end
  end

  # GET /rounds/new
  def new
    @round = Round.new
  end

  # GET /rounds/1/edit
  def edit
  end

  # POST /rounds
  # POST /rounds.json
  def create
    @round = Round.new(round_params)
    @round.started = false

    respond_to do |format|
      if @round.save
        format.html { redirect_to @round, notice: 'Round was successfully created.' }
        format.json { render action: 'show', status: :created, location: @round }
      else
        format.html { render action: 'new' }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rounds/1
  # PATCH/PUT /rounds/1.json
  def update
    respond_to do |format|
      if @round.update(round_params)
        format.html { redirect_to :back, notice: 'Round was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rounds/1
  # DELETE /rounds/1.json
  def destroy
    @round.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
    


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round
      @round = Round.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def round_params
      params.require(:round).permit(:round_no, :name, :about, :turn_duration, :start_date, :vote_date, :calc_date)
    end
end
