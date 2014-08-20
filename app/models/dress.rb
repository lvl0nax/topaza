class Dress < ActiveRecord::Base
  has_many :images, foreign_key: :dress_id
  has_and_belongs_to_many :dress_consists
end