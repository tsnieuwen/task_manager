class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
  end

  def create
    require "pry"; binding.pry
    task = Task.new({
      title: params[:task][:title],
      description: params[:task][:description]
      })
      require "pry"; binding.pry
    task.save
    require "pry"; binding.pry
    redirect_to '/tasks'
  end

  def show
    require "pry"; binding.pry
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update({
      title: params[:task][:title],
      description: params[:task][:description]
      })
      task.save
      redirect_to "/tasks/#{task.id}"
  end

  def destroy
    Task.destroy(params[:id])
    redirect_to '/tasks'
  end

end
