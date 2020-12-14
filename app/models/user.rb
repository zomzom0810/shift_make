class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :position

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:user_name]

  
  with_options presence: true do
    validates :user_name format: {with: }
    validates :position_id, numericality: { other_than: 1 }
    validates :name_kana, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :name_kana, format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/}
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

