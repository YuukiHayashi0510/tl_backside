class Lecture < ApplicationRecord

    has_many :comments, dependent: :destroy
    has_many :evaluations

    # 多対多のアソシエーション
    has_many :current_users, through: :current_lectures
    has_many :past_users, through: :past_lectures
    has_many :past_lectures, dependent: :destroy
    has_many :current_lectures, dependent: :destroy

    mount_uploader :pdf, PdfUploader

end
