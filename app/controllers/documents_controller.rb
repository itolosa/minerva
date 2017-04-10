class DocumentsController < ApplicationController
  before_action :set_course
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  after_action :verify_authorized

  # GET /documents
  # GET /documents.json
  def index
    @documents = policy_scope(@course.documents.all)
    authorize Document
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    authorize @document
  end

  # GET /documents/new
  def new
    @document = Document.new
    authorize @document
  end

  # GET /documents/1/edit
  def edit
    authorize @document
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = @course.documents.build(document_params)
    @document.user = current_user
    authorize @document
    
    respond_to do |format|
      if @document.save
        format.html { redirect_to [@course, @document], notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: [@course, @document] }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    authorize @document
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to [@course, @document], notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: [@course, @document] }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    authorize @document
    @document.destroy
    respond_to do |format|
      format.html { redirect_to course_documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_course
      @course = Course.find(params[:course_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = @course.documents.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:title, :description, :user_id, :document_category_id, :downloads_count, :content, course_attributes: [:id])
    end
end
