class StaticContentController < ApplicationController
    after_filter do |controller|
        if response.headers["Cache-Control"] == nil
            response.headers["Cache-Control"] = 's-maxage=3, max-age=3, public'
        end
    end
 end