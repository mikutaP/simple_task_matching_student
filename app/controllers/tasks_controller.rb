class TasksController < ApplicationController
  before_action :get_task, only: [:show]

  def index
    @tasks = Task.where field: params[:field]
  end

  def show
    @company = User.find_by id: @task.user_id
    return unless @company
  end

  private

  def get_task
    @task = Task.find_by id: params[:id]
    return unless @task
  end

  def task_params
    params.require(:task).permit :name, :content, :field, :area, :salary,
                                 :registration_deadline, :task_deadline, :veteran, :descript_url, :money_unit
  end
end
