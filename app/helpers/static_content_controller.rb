class StaticContentController < ApplicationController
  	after_filter do |controller|
  		if response.headers["Cache-Control"] == nil
  			response.headers["Cache-Control"] = 's-maxage=86400, max-age=86400, public'
  		end
  	end
 end