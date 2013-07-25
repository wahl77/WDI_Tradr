class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :username, :password, :password_confirmation, :cash

  has_many :userstockinfos, dependent: :destroy
  has_many :stocks, through: :userstockinfos


  validates :username,
    presence: true, 
    uniqueness: true

  validates :password,
    presence: true, on: :create,
    confirmation: true

  validates :cash,
    numericality: true
    
  # Downcase all usernames by default
  def username=(value)
    write_attribute :username, value.downcase
  end
end
