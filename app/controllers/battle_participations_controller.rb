class BattleParticipationsController < ApplicationController
  before_action :set_battle_participation, only: [:show, :edit, :update, :destroy]

  # GET /battle_participations
  # GET /battle_participations.json
  def index
    @battle_participations = BattleParticipation.all
  end

  # GET /battle_participations/1
  # GET /battle_participations/1.json
  def show
  end

  # GET /battle_participations/new
  def new
    @battle_participation = BattleParticipation.new
  end

  # GET /battle_participations/1/edit
  def edit
  end

  # POST /battle_participations
  # POST /battle_participations.json
  def create
    @battle_participation = BattleParticipation.new(battle_participation_params)

    respond_to do |format|
      if @battle_participation.save
        format.html { redirect_to @battle_participation, notice: 'Battle participation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @battle_participation }
      else
        format.html { render action: 'new' }
        format.json { render json: @battle_participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /battle_participations/1
  # PATCH/PUT /battle_participations/1.json
  def update
    respond_to do |format|
      if @battle_participation.update(battle_participation_params)
        format.html { redirect_to @battle_participation, notice: 'Battle participation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @battle_participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /battle_participations/1
  # DELETE /battle_participations/1.json
  def destroy
    @battle_participation.destroy
    respond_to do |format|
      format.html { redirect_to battle_participations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_battle_participation
      @battle_participation = BattleParticipation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def battle_participation_params
      params.require(:battle_participation).permit(:character_id, :battle_id, :status)
    end
end
