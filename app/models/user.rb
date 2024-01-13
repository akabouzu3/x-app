class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # usernameは大文字小文字のアルファベット,数字,アンダーバーで構成
  VALID_USERNAME_REGEX = /\A[\w]+\z/
  before_save {self.email = self.email.downcase}
  validates(:name, {
    presence: true,
    length: {maximum: 50}
  })
  validates(:email, {
    presence: true,
    length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: { case_sensitive: false}
  })
  validates(:username, {
    presence: true,
    length: {maximum: 30},
    format: {with: VALID_USERNAME_REGEX},
    uniqueness: { case_sensitive: false}
  })

  has_secure_password
  validates(:password, {
    presence: true, 
    length: {minimum: 6}, 
    allow_nil: true
  })



end
