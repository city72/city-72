class MostlyStaticContentController < ApplicationController
    after_filter do |controller|
        if response.headers["Cache-Control"] == nil
            response.headers["Cache-Control"] = 's-maxage=3600, max-age=3600, public'
        end
    end
 end