class User < ApplicationRecord

  before_save { self.email = email.downcase }
  before_create :create_activation_digest
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password

  attr_accessor :remember_token, :activation_token

  def authenticated?(attribute ,token)
    # use 'send' function to optimise the codes.
  # if attribute == "remember_digest"
  #     BCrypt::Password.new(remember_digest).is_password?(remember_token)
  #   elsif attribute == "activate_digest"
  #     BCrypt::Password.new(activate_digest).is_password?(acitve_token)"
      digest = self.send(attribute)
      BCrypt::Password.new(digest).is_password?(token)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    self.update(remember_digest: nil)
  end

  def User.digest(string)
    BCrypt::Password.create(string)
  end

  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  # 激活账户
    def activate
      update_attribute(:activated, true)
      update_attribute(:activated_at, Time.zone.now)
    end

    # 发送激活邮件
    def send_activation_email
      UserMailer.account_activation(self).deliver_now
    end
  end
