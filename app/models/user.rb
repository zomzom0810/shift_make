class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :position

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:user_name]

  
  with_options presence: true do
    validates :user_name
    validates :position_id, numericality: { other_than: 1 }
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

