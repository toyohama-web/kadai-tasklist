# タスクのRouterには resources を利用する
Rails.application.routes.draw do
  root to: "tasks#index"
  resources :tasks
end
