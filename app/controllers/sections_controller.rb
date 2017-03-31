class SectionsController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in
  before_action :find_page
  before_action :set_section_count, :only => [:new, :create, :edit, :update]

  def index
    @sections = @page.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(:page_id => @page.id)
  end

  def create
    @section = Section.new(section_params)
    @section.page = @page
    if @section.save
      # If save succeeds, redirect to the index action
      redirect_to sections_path(:page_id => @page.id), notice: "Section created successfully."
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    # Find a new object using form parameters
    @section = Section.find(params[:id])
    # update the object
    if @section.update_attributes(section_params)
      redirect_to sections_path(:page_id => @page.id), notice: "Section updated successfully."
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section destroyed successfully."
    redirect_to(sections_path(:page_id => @page.id))
  end

  private

  def section_params
    params.require(:section).permit(:name, :position, :visible, :content_type, :content)
  end

  def find_page
    @page = Page.find(params[:page_id])
  end

  def set_section_count
    @section_count = @page.sections.count
    if params[:action] == 'new' || params[:action] == 'create'
     @section_count += 1
    end
  end

end
