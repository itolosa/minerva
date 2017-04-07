class DocumentCategoriesController < ApplicationController
  before_action :set_course
  before_action :set_document_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  after_action :verify_authorized

  # GET /document_categories
  # GET /document_categories.json
  def index
    @document_categories = policy_scope(@course.document_categories.all)
    authorize DocumentCategory
  end

  # GET /document_categories/1
  # GET /document_categories/1.json
  def show
    authorize @document_category
  end

  # GET /document_categories/new
  def new
    @document_category = DocumentCategory.new
    authorize @document_category
  end

  # GET /document_categories/1/edit
  def edit
    authorize @document_category
  end

  # POST /document_categories
  # POST /document_categories.json
  def create
    @document_category = @course.document_categories.build(document_category_params)
    @document_category.user = current_user
    authorize @document_category

    respond_to do |format|
      if @document_category.save
        format.html { redirect_to [@course, @document_category], notice: 'Document category was successfully created.' }
        format.json { render :show, status: :created, location: [@course, @document_category] }
      else
        format.html { render :new }
        format.json { render json: @document_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_categories/1
  # PATCH/PUT /document_categories/1.json
  def update
    authorize @document_category
    respond_to do |format|
      if @document_category.update(document_category_params)
        format.html { redirect_to [@course, @document_category], notice: 'Document category was successfully updated.' }
        format.json { render :show, status: :ok, location: [@course, @document_category] }
      else
        format.html { render :edit }
        format.json { render json: @document_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_categories/1
  # DELETE /document_categories/1.json
  def destroy
    authorize @document_category
    @document_category.destroy
    respond_to do |format|
      format.html { redirect_to course_document_categories_url, notice: 'Document category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_course
      @course = Course.find(params[:course_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_document_category
      @document_category = @course.document_categories.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_category_params
      params.require(:document_category).permit(:name, :description, course_attributes: [:id])
    end
end
