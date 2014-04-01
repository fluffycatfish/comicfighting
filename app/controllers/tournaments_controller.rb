class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :edit, :update, :destroy]

  # GET /tournaments
  # GET /tournaments.json
  def index
    @tournaments = Tournament.all
  end

  def next_round
    if current_user.try(:admin?)
      if(@tournament.round_no > )
        @tournament.update_attribute :current_round,(@tournament.current_round + 1)
      end
    end
  emd

  def start_tournament
    @tournament = Tournament.find(params[:id])
    if current_user.try(:admin?)
      @tournament.update_attribute :state, true
    end
    redirect_to :back
  end

  # GET /tournaments/1
  # GET /tournaments/1.json
  def show
    @participated = false
    # continue here
    @rounds = @tournament.rounds
    if current_user
      @characters = current_user.characters
      @characters.each do |character|
        @chatours = character.tournaments
        @chatours.each do |chatour|
          if chatour.id == @tournament.id
            @participated = true
            @character = character
          end
        end
      end
    end  

  end

  # GET /tournaments/new
  def new
    @tournament = Tournament.new
  end

  # GET /tournaments/1/edit
  def edit
  end

  # POST /tournaments
  # POST /tournaments.json
  def create
    @tournament = Tournament.new(tournament_params)

    @tournament.current_round = 0
    @tournament.state = false

    respond_to do |format|
      if @tournament.save
        format.html { redirect_to @tournament, notice: 'Tournament was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tournament }

        # Create all rounds when tournament is created
        @tournament.round_no.times do |x|
          @round = Round.new
          @round.round_no = x + 1
          @round.tournament_id = @tournament.id
          @round.name = @tournament.name + " round " + (x + 1).to_s 
          @round.turn_duration = 7
          @round.save
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournaments/1
  # PATCH/PUT /tournaments/1.json
  def update
    respond_to do |format|
      if @tournament.update(tournament_params)
        format.html { redirect_to @tournament, notice: 'Tournament was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournaments/1
  # DELETE /tournaments/1.json
  def destroy
    @tournament.destroy
    respond_to do |format|
      format.html { redirect_to tournaments_url }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_params
      params.require(:tournament).permit(:name, :about, :round_no, :state, :participation_cap)
    end
end
