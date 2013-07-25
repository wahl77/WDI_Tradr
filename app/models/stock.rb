class Stock < ActiveRecord::Base
  attr_accessible :name, :ticker
  has_many :userstockinfos
  has_many :users, through: :userstockinfos

  validates :ticker,
    uniqueness: true,
    presence: true

end
