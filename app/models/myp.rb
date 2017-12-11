class Myp < ActiveRecord::Base
  validates :uname, presence: true
  validates :uaddress, presence: true
  validates :ubankaccount, presence: true
  validates :ubankaccount, numericality: { only_integer: true, greater_than: 0 }
end
