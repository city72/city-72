class DynamicContentController < ApplicationController
    after_filter do |controller|
        if response.headers["Cache-Control"] == nil
            response.headers["Cache-Control"] = 's-maxage=60, max-age=60, public'
        end
    end
 end