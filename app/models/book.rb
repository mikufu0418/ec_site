class Book < ApplicationRecord
    has_many:Taggings
    has_many:tags, through: :Taggings, dependent: :destroy
    has_many :line_items, dependent: :destroy
    has_many :order_details, dependent: :destroy 
    has_many :orders, through: :order_details 
    has_one_attached :photo
    
    def thumbnail
      photo.variant(resize_to_fill: [200, 200])
    end
    enum status: {sale: 1, soldout: 2}
    validates :title, presence: true
    validates :author, presence: true
    validates :price, presence: true
    validates :tags, presence: true
    validates :summary, presence: true, length: { in: 10..30 }
end
