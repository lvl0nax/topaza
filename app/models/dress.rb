class Dress < ActiveRecord::Base
  has_many :images
  has_many :dress_consists
end