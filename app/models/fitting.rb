class Fitting < ActiveRecord::Base
  has_and_belongs_to_many :dresses, dependent: :nullify
end
