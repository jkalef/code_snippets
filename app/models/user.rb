class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


   #--ASSOCIATIONS--------------------------------
   has_many :notes, dependent: :nullify
   has_many :comments, dependent: :nullify


   #--CLASS METHODS---------------------------------
   def show_name
   	 if first_name || last_name
   	 		"#{first_name} #{last_name}"
   	 	else
   	 		:email
   	 end
   end

end
