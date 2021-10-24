class TaskPolicy
  def initialize(user, task_user)
    @user = user
    @task_user = task_user
  end

  def allowed?
    task_owner?
  end

  private

  attr_reader :user, :task_user

  def task_owner?
    user.id == task_user.id
  end
end