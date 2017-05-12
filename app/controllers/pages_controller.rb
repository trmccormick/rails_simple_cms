class PagesController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in
  before_action :find_subject
  before_action :set_page_count, only: %i[new create edit update]

  def index
    @page = @subject.pages.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(subject_id: @subject.id)
  end

  def create
    @page = Page.new(page_params)
    @page.subject = @subject
    if @page.save
      # If save succeeds, redirect to the index action
      notice_str = 'Page created successfully.'
      redirect_to pages_path(subject_id: @subject.id), notice: notice_str
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    # Find a new object using form parameters
    @page = Page.find(params[:id])
    # update the object
    if @page.update_attributes(page_params)
      notice_str = 'Page updated successfully.'
      redirect_to page_path(@page, subject_id: @subject.id), notice: notice_str
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    notice_str = 'Page destroyed successfully.'
    redirect_to pages_path(subject_id: @subject.id), notice: notice_str
  end

  private

  def page_params
    params.require(:page).permit(:name, :position, :visible, :permalink, :image)
  end

  def find_subject
    @subject = Subject.find(params[:subject_id])
  end

  def set_page_count
    @page_count = @subject.pages.count
    @page_count += 1 if params[:action] == 'new' || params[:action] == 'create'
  end
end
