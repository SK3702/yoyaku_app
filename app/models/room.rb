class Room < ApplicationRecord
    validates :room_name, presence: true
    validates :memo, presence: true
    validates :price, presence: true
    validates :address, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 1}

    def self.search(search)
        return Room.all unless search
        Room.where("memo LIKE(?)", "%#{search}%").or(Room.where("address LIKE(?)", "%#{search}%"))
    end

    mount_uploader :room_image, RoomImageUploader

    belongs_to :user
    has_many :reservations 
end
