class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :position

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:user_name]

  
  with_options presence: true do
    validates :user_name, uniqueness: true, format: {with: /\A[a-z0-9]+\z/ }  #半角アルファベット（小文字・数値）
    validates :position_id, numericality: { other_than: 1 }
    validates :name, uniqueness: true, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/} #日本語のみ
    validates :name_kana, format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/} #カタカナのみ
  end

#  emailを不使用に
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
   false
  end
#  emailを不使用に
end

