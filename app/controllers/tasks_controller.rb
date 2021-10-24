class TasksController < ApplicationController
  before_action :set_user

  def index
    redirect_to errors_unauthorized_path unless policy.allowed?

    tasks = Tasks::FilterQuery.new(user_id: @current_user.id,
                                   from_date: Date.today,
                                   to_date: Date.today + 1.week,
                                   status: "to_do",
                                   tag_id: params[:tag_id])
                              .call

    @tasks = tasks.includes(:tags).order(:priority, :deadline)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  rescue ActiveRecord::RecordNotFound
    @user = @current_user
  end

  def policy
    TaskPolicy.new(@current_user, @user)
  end
end
