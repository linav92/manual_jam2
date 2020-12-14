class User < ApplicationRecord
  validates :name, presence: true
  has_many :stories
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         def current_admin
          current_user && current_user.is_admin
        end
end
