class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable

  # Add :encryptable because of the invalid hash error message raised upon login.
  # http://stackoverflow.com/questions/3840072/migrating-from-authlogic-to-devise
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :timeoutable, :encryptable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation

  # Predicate to know what kind of user this is
  %w(Candidate Consultant Employer).each do |class_name|
    define_method "#{class_name.downcase}?" do
      self.class.to_s == class_name
    end
  end
end
