class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
		
		 acts_as_user :roles => [:iscritto,:editor, :admin]


   def self.from_omniauth(access_token)
    	data = access_token.info

    	user = User.where(email: data['email']).first
		# Uncomment the section below if you want users to be created if they don't exist
	     unless user
	         user = User.create( email: data['email'],
	            password: Devise.friendly_token[0,20]
	         )
	     end
		user
	end

	def is_admin?
		return (self.roles_mask & 3) == 3
	  end
	
	 def set_admin
		self.roles_mask = (self.roles_mask | 3) 
		self.save
	  end
	
	def unset_admin
		self.roles_mask = (self.roles_mask & 2) 
		self.save
	  end
	
	
	 def is_editor?
		  return (self.roles_mask & 2) == 2
	  end
	
	
	 def is_banned?
		return self.roles_mask  == 0
	  end
	
	 def set_editor
		  self.roles_mask = 2
		  self.save
	  end
	
	def unset_editor
		  self.roles_mask = 1
		  self.save
	  end

	def is_iscritto?
		return (self.roles_mask & 1) == 1
	end
	
	def set_iscritto
		self.roles_mask = (self.roles_mask | 1) 
		self.save
	end
  
  def unset_iscritto
		self.roles_mask = 0 
		self.save
	end
	has_many :songs
	has_many :playlists
	
end
