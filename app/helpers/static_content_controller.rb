class StaticContentController < ApplicationController
    after_filter do |controller|
        if response.headers["Cache-Control"] == nil
            # response.headers["Cache-Control"] = 's-maxage=86000, max-age=86000, public'
            response.headers["Cache-Control"] = 's-maxage=0, max-age=0, public'
        end
    end
 end