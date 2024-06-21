class Book < ApplicationRecord
    has_many:Taggings
    has_many:tags, through: :Taggings, dependent: :destroy
    has_many :line_items
    has_many :order_details, dependent: :destroy 
    has_many :orders, through: :order_details 
    has_one_attached :photo
    
    def thumbnail
      photo.variant(resize_to_fill: [300, 300])
    end
    enum status: {sale: 1, soldout: 2}
end
