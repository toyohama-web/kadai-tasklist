class TasksController < ApplicationController
  # 一覧
  def index
    @tasks = Task.all
  end
  
  # 詳細
  def show
    @task = Task.find(params[:id])
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
    @task = Task.find(params[:id])
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
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = "タスクは削除されました。"
    redirect_to tasks_url
  end
  
  private
  
  # Strong Parameter
  def task_params
    params.require(:task).permit(:content)
  end
end
