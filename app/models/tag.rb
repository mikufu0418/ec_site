class Tag < ApplicationRecord
    has_many:Taggings
    has_many:books, through: :Taggings, dependent: :destroy
end
