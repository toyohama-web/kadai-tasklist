class Task < ApplicationRecord
  # バリデーション、空文字不可、１０文字以内
  validates :status, presence: true, length: { maximum: 10 }  
end
