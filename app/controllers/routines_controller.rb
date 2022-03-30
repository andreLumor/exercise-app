class RoutinesController < ApplicationController
  before_action :check_token, except: [:index]
  before_action :authenticate_user!, except: [:index]
  helper_method :exercises
  
  # GET /routines or /routines.json
  def index
    @routines = Routine.all
  end

  # GET /routines/new
  def new
    @exercises = Exercise.all
    @routine = Routine.new
  end

  # POST /routines or /routines.json
  def create
    @routine = Routine.new(routine_params)

    respond_to do |format|
      if @routine.save
        format.html { redirect_to routines_path, notice: "Routine was successfully created." }
        format.json { render :show, status: :created, location: @routine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @routine.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_routine
      @routine = Routine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def routine_params
      params.require(:routine).permit(:name, exercise_ids: [])
    end

    # Exercises helper, so i can use it after rendering partial
    def exercises
      @exercises = Exercise.all 
    end
end
