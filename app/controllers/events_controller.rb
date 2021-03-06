class EventsController < ApplicationController
  before_action :set_course
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  after_action :verify_authorized

  # GET /events
  # GET /events.json
  def index
    @events = policy_scope(@course.events.all)
    authorize Event
  end

  # GET /events/1
  # GET /events/1.json
  def show
    authorize @event
  end

  # GET /events/new
  def new
    @event = Event.new
    authorize @event
  end

  # GET /events/1/edit
  def edit
    authorize @event
  end

  # POST /events
  # POST /events.json
  def create
    @event = @course.events.build(event_params)
    @event.user = current_user
    authorize @event

    respond_to do |format|
      if @event.save
        format.html { redirect_to [@course, @event], notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: [@course, @event] }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    authorize @event
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to [@course, @event], notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: [@course, @event] }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    authorize @event
    @event.destroy
    respond_to do |format|
      format.html { redirect_to course_events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_course
      @course = Course.find(params[:course_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = @course.events.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :starts_at, :ends_at, :user_id, :location, course_attributes: [:id])
    end
end
