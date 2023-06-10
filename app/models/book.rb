class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments
  has_many :favorites
  
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) }
  scope :created_2days_ago, -> { where(created_at: 2.days.ago.all_day) }
  scope :created_3days_ago, -> { where(created_at: 3.days.ago.all_day) }
  scope :created_4days_ago, -> { where(created_at: 4.days.ago.all_day) }
  scope :created_5days_ago, -> { where(created_at: 5.days.ago.all_day) }
  scope :created_6days_ago, -> { where(created_at: 6.days.ago.all_day) }
  
  scope :created_this_week, -> { where(created_at: 1.week.ago.beginning_of_day..Time.zone.now.end_of_day) }
  scope :created_last_week, -> { where(created_at: 2.weeks.ago.beginning_of_day..2.weeks.ago.end_of_week) }

end
