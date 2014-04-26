class QuestionsController < ApplicationController

  def new
    @question = Question.new
    @course = Course.find(params["course_id"])
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: @question.id).sort_by { |a| [ a.student_id ? 0 : 1, a.created_at] }.reverse
    @new_answer = Answer.new
  end

  def index
  end

  def create
    q = Question.new
    q.text = params["question"]["text"]

    session[:student_id] = 1
    q.student_id = current_student.id
    q.course_id = params["course_id"]
    q.save

    redirect_to course_path(params["course_id"])
  end

  def edit
  end

  def update
  end

  def destroy
  end


end