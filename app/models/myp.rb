class Myp < ActiveRecord::Base
  validates :uname, presence: true
  validates :uaddress, presence: true
  validates :ubankaccount, presence: true
end
