class Dress < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :images, as: :imageable, dependent: :destroy
  has_and_belongs_to_many :dress_consists, dependent: :nullify
  has_and_belongs_to_many :dresses, dependent: :nullify
  belongs_to :category
end
