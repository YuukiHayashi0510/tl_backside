class Question < ApplicationRecord

    mount_uploader :image, ImageUploader

    belongs_to :user, optional: true

    has_many :answers, dependent: :destroy

end
