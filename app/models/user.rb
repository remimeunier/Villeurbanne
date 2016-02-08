class User < ActiveRecord::Base

	belongs_to :vendor
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def add_vendor_to_user(id)
  	vendor_id = id
  	save	
  end
end
