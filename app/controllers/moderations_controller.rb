class ModerationsController < ApplicationController
  before_action :set_course
  before_action :set_moderation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  after_action :verify_authorized

  # GET /moderations
  # GET /moderations.json
  def index
    @moderations = @course.moderations.all
    authorize Moderation
  end

  # GET /moderations/1
  # GET /moderations/1.json
  def show
    authorize @moderation
  end

  # GET /moderations/new
  def new
    @moderation = Moderation.new
    authorize @moderation
  end

  # GET /moderations/1/edit
  def edit
    authorize @moderation
  end

  # POST /moderations
  # POST /moderations.json
  def create
    @moderation = @course.moderations.build(moderation_params)
    authorize @moderation

    respond_to do |format|
      if @moderation.save
        format.html { redirect_to [@course, @moderation], notice: 'Moderation was successfully created.' }
        format.json { render :show, status: :created, location: [@course, @moderation] }
      else
        format.html { render :new }
        format.json { render json: @moderation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moderations/1
  # PATCH/PUT /moderations/1.json
  def update
    authorize @moderation

    respond_to do |format|
      if @moderation.update(moderation_params)
        format.html { redirect_to [@course, @moderation], notice: 'Moderation was successfully updated.' }
        format.json { render :show, status: :ok, location: [@course, @moderation] }
      else
        format.html { render :edit }
        format.json { render json: @moderation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moderations/1
  # DELETE /moderations/1.json
  def destroy
    @moderation.destroy
    authorize @moderation

    respond_to do |format|
      format.html { redirect_to course_moderations_url, notice: 'Moderation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_course
      @course = Course.find(params[:course_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_moderation
      @moderation = @course.moderations.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def moderation_params
      params.require(:moderation).permit(:course_id, :user_id, course_attributes: [:id])
    end
end
