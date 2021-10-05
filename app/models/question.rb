class Question < ApplicationRecord

    mount_uploader :image, ImageUploader

    belongs_to :user, optional: true

    has_many :answers, dependent: :destroy

    # いいね機能
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

    validates :solved, inclusion: { in: [true,false] }

end
