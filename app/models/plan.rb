class Plan < ActiveRecord::Base
  attr_accessible :description,
                  :motivation
end