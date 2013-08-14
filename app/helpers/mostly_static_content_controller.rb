class MostlyStaticContentController < ApplicationController
    after_filter do |controller|
        if response.headers["Cache-Control"] == nil
            response.headers["Cache-Control"] = 's-maxage=2, max-age=2, public'
        end
    end
 end