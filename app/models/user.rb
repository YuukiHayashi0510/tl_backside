class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :confirmable, :lockable, :timeoutable, :trackable, :authentication_keys => [:login]

  validates :name,
  presence: true, uniqueness: { case_sensitive: :false },
  length: { minimum: 4, maximum: 20 }, 
  format: { with: /\A[a-z0-9]+\z/, message: "ユーザー名は半角英数字です"}
  validates :profile, length: { maximum: 200 }

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :evaluations, dependent: :destroy

  # いいね機能
  has_many :likes, dependent: :destroy
  has_many :liked_questions, through: :likes, source: :question

  # 多対多のアソシエーション
  has_many :lectures_current, through: :current_lectures, source: :lecture
  has_many :lectures_past, through: :past_lectures, source: :lecture
  has_many :current_lectures, dependent: :destroy
  has_many :past_lectures, dependent: :destroy

  # ログインにメアド、名前使えるようにする
  attr_accessor :login

  # トップ画像の実装 
  mount_uploader :image, ImageUploader

  # ユーザーネームorメアドでログインできるようにする
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["name = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end


  # 現在の講義に登録されているか確認
  def already_current_registered?(lecture)
    self.current_lectures.exists?(lecture_id: lecture.id)
  end

  # 過去の講義に登録されているか確認
  def already_past_registered?(lecture)
    self.past_lectures.exists?(lecture_id: lecture.id)
  end

  # いいねされているかチェック
  def already_liked?(question)
    self.likes.exists?(question_id: question.id)
  end

end