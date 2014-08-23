class Scenario < ActiveRecord::Base
	belongs_to :project
	belongs_to :persona
end
