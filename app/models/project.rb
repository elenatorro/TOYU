class Project < ActiveRecord::Base
  attr_accessor :email, :password, :password_confirmation
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  before_save :encrypt_password
  has_secure_password validations: false

  has_one :analysis
  has_one :sorting_test
  has_one :site_requirement
  has_many :user_requirements
  has_many :use_cases
  has_many :cards
  has_many :interviews
  has_many :personas
  has_many :scenarios
  has_many :tasks
  has_many :card_images
  validates :name, presence: true, 
					 length: { maximum: 20 }, 
					 format: { with: /\A[a-zA-Z0-9' ']*\z/ },
					 uniqueness: true

  validates :email, :presence => true, :format => EMAIL_REGEX, :on => :create
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  
  def self.authenticate(email, password)
    project = find_by_email(email)
    if project && project.password_hash == BCrypt::Engine.hash_secret(password, project.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def confirm!
    update_attributes!(confirmation_token: nil, confirmed: true)
  end

  def set_session_token
    new_session_token = SecureRandom.urlsafe_base64(24)
    update_attributes(session_token: new_session_token)
    return new_session_token
  end

end