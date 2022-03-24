class OperationsController < ApplicationController

    def trigger
        op_id = params[:id]
        if op_id == '1'
            if Tmdb.save_top20_popular_to_movies
                @message = 'Succeed'
            else
                @message = 'Failed'
            end
        else
            @message = 'Not Valid operation'
        end
    end
end