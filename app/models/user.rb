class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 #has_many :complaints        

 def send_password_reset
   generate_token(:reset_password_token)
   self.reset_password_sent_at = Time.zone.now
   save!
   UserMailer.password_reset(self).deliver
 end  

 def generate_token(column)
   begin
     self[column] = SecureRandom.urlsafe_base64
   end while User.exists?(column => self[column])
 end  
end
