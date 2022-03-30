class ExercisesController < ApplicationController
  before_action :check_token
  before_action :authenticate_user! 

  # GET /exercises/new
  def new
    @exercise = Exercise.new
  end

  # POST /exercises or /exercises.json
  def create
    @exercise = Exercise.new(exercise_params)

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to routines_path, notice: "Exercise was successfully created." }
        format.json { render :show, status: :created, location: @exercise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def exercise_params
      params.require(:exercise).permit(:description, :intensity)
    end
end
