class DynamicContentController < ApplicationController
    after_filter do |controller|
        if response.headers["Cache-Control"] == nil
            response.headers["Cache-Control"] = 's-maxage=1, max-age=1, public'
        end
    end
 end