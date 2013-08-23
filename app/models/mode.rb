class Mode < ActiveRecord::Base
	attr_accessible :title, :text, 
		:recommendation_1_title, :recommendation_1_text, 
		:recommendation_2_title, :recommendation_2_text,
		:recommendation_3_title, :recommendation_3_text

	validates_uniqueness_of :em_mode

	def self.last_crisis_mode_info
		Mode.where(em_mode: true).first
	end

end