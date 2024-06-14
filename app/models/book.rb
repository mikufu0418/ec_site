class Book < ApplicationRecord
    has_many:Taggings
    has_many:tags, through: :Taggings, dependent: :destroy
end
