class SubjectsController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in
  before_action :find_subjects, only: [:index]
  before_action :set_subject_count, only: %i[new create edit update]

  def index
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new(name: 'Default')
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      # If save succeeds, redirect to the index action
      notice_str = "Subject '#{@subject.name}' created successfully."
      redirect_to subjects_path, notice: notice_str
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    # Find a new object using form parameters
    @subject = Subject.find(params[:id])
    # update the object
    if @subject.update_attributes(subject_params)
      notice_str = "Subject '#{@subject.name}' updated successfully."
      redirect_to subjects_path, notice: notice_str
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    notice_str = "Subject '#{@subject.name}' destroyed successfully."
    redirect_to subjects_path, notice: notice_str
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible, :created_at)
  end

  def find_subjects
    @subjects = Subject.sorted
  end

  def set_subject_count
    @subject_count = Subject.count
    @subject_count += 1 if params[:action] == 'new' || params[:action] == 'create'
  end
end
