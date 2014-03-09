class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_one :profile

         # note to self:
         # to grant admin attribute to the current user
         # current_user.update_attribute :admin, true

         #if current_user.try(:admin?)
         #for supporting pages without current user

end
