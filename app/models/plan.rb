class Plan < ActiveRecord::Base
  attr_accessible :city_id, :emergency_type_cd

  as_enum :emergency_type, earthquake: 0, hurricane: 1, flood: 2
end
