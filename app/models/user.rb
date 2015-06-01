class User < ActiveRecord::Base
  validates :email, :name, presence: true
  validates :name, length: { minimum: 3 }
  validates :email, format: /.+@.+\..+/
end
