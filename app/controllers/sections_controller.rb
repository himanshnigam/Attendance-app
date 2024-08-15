class SectionsController < ApplicationController
  before_action :authenticate_student!
  before_action :set_section, only: %i[ show edit update destroy ]
  before_action :correct_student, only: [:edit, :update, :destroy]


  def index
    @sections = Section.all
  end

  def show
  end

  def new
    # @section = Section.new
    @section = current_student.sections.build
  end

  def edit
  end

  def create
    # @section = Section.new(section_params)
    @section = current_student.sections.build(section_params)
    @section.student_number = current_student.id
    
    respond_to do |format|
      if @section.save
        format.html { redirect_to section_url(@section), notice: "Section was successfully created." }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to section_url(@section), notice: "Section was successfully updated." }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @section.destroy!
    respond_to do |format|
      format.html { redirect_to sections_url, notice: "Section was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_student
    @section = current_student.sections.find_by(id: params[:id])
    redirect_to sections_path, notice: "You are not authorized for this action" if @section.nil?
  end

  private

  def set_section
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:student_name, :student_no, :number, :email, :address, :student_photo, student_subjects: [] )
  end
end
