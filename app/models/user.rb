class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    validates 	:username,
    			:uniqueness => {:case_sensitive => false}
          
	has_one :profile
	has_many :characters
  has_many :character_sheets
  has_many :profile_pics

	attr_accessor :login

	def self.find_first_by_auth_conditions(warden_conditions)
		conditions = warden_conditions.dup
    	if login = conditions.delete(:login)
    		where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    		else
       			where(conditions).first
      		end
    	end
	end

#note to self
#if current_user.try(:admin?)
#for supporting pages without current user