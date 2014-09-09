class Category < ActiveRecord::Base
  has_many :dresses, dependent: :nullify
end
