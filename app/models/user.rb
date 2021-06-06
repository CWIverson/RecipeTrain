class User < ApplicationRecord
    has_many :recipes
    has_secure_password
    validates :email, uniqueness: true
    validates :username, :email, presence: true
    validates_presence_of :password, :on => :create, :if => :password_required
    before_validation :no_password_omniauth
    @called_omniauth = false
    # validates_presence_of :username
    # validates_uniqueness_of :username
    # validates_presence_of :email
    # validates_uniqueness_of :email
    # validates_presence_of :password
    def self.create_from_omniauth(auth)
        @called_omniauth = true
        # byebug
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['first_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(16)
            
            
        end
        
    end
    def password_required
        # byebug
        puts @called_omniauth
        if @called_omniauth == true
            return false
        else
            return true
        end
        #byebug
        # return false if @called_omniauth == true
        # (!password.blank?)
    end
    private

    def no_password_omniauth
        
      self.password_digest = 0 unless password_required
    end

end
