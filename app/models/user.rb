class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    validates 	:username,
    			:uniqueness => {:case_sensitive => false}
	has_one :profile

	attr_accessor :login

         # note to self:
         # to grant admin attribute to the current user
         # current_user.update_attribute :admin, true

         #if current_user.try(:admin?)
         #for supporting pages without current user

	def self.find_first_by_auth_conditions(warden_conditions)
		conditions = warden_conditions.dup
    	if login = conditions.delete(:login)
    		where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    		else
       			where(conditions).first
      		end
    	end
	end
