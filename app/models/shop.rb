class Shop < ApplicationRecord
  belongs_to :user ,optional: true
  
  validates :name, presence: true, length: { maximum: 100 }
  validates :introduction, presence: true, length: { maximum: 255 }
  validates :time, presence: true, length: { maximum: 50 }
  validates :holiday, presence: true, length: { maximum: 50 }
  validates :phone, presence: true, length: { maximum: 20 }
  validates :address, presence: true, length: { maximum: 200 }
  
  mount_uploader :picture, ImageUploader
  
  geocoded_by :address
  after_validation :geocode
end
