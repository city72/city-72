class Mode < ActiveRecord::Base
	attr_accessible :em_mode, :title, :text, 
		:recommendation_1_title, :recommendation_1_text, 
		:recommendation_2_title, :recommendation_2_text,
		:recommendation_3_title, :recommendation_3_text
end