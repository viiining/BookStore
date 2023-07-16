class Book < ApplicationRecord
    validates :bookname, presence: true
    validates :page, presence: true, numericality: { greater_than: 0 }
    validates :price, presence: true, numericality: { greater_than: 0 }
end
