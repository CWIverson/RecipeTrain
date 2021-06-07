class User < ApplicationRecord
    has_many :recipes
    has_secure_password
    validates :email, uniqueness: true
    validates :username, :email, presence: true
    validates_presence_of :password, :on => :create, :if => :password_required
    before_validation :no_password_omniauth
    @called_omniauth = false

    def self.create_from_omniauth(auth)
        @called_omniauth = true
        
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['first_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(16)
        end
        
    end

    def password_required
        puts @called_omniauth
        if @called_omniauth == true
            return false
        else
            return true
        end
    end

    private
    def no_password_omniauth      
      self.password_digest = 0 unless password_required
    end
end
