class History < ActiveRecord::Base
  default_scope {order(:date)}
end