class TasksController < ApplicationController
  # before_action, 共通化
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  # 一覧
  def index
    @tasks = Task.all.page(params[:page]).per(15)
  end
  
  # 詳細
  def show
  end
  
  # 作成ページ
  def new
    @task = Task.new
  end
  
  # 作成
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "タスクが登録されました。"
      redirect_to @task
    else
      flash.now[:danger] = "タスクの登録に失敗しました。"
      render :new
    end
  end
  
  # 編集
  def edit
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = "タスクが更新されました。"
      redirect_to @task
    else
      flash.now[:danger] = "タスクの更新に失敗しました。"
      render :edit
    end
  end
  
  # 削除
  def destroy
    @task.destroy
    
    flash[:success] = "タスクは削除されました。"
    redirect_to tasks_url
  end
  
  private

  def set_task
    @task = Task.find(params[:id])
  end
  
  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
end
