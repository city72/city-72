class DynamicContentController < ApplicationController
    after_filter do |controller|
        if response.headers["Cache-Control"] == nil
            # response.headers["Cache-Control"] = 's-maxage=60, max-age=60, public'
            response.headers["Cache-Control"] = 's-maxage=0, max-age=0, public'
        end
    end
 end