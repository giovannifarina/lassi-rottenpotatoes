class ReviewsController < ApplicationController
	
	def new
		id_movie = params[:movie_id]
		@movie = Movie.find(id_movie)
		@moviegoers = Moviegoer.all
		@review = Review.new
	end
	
	def create
		id_movie = params[:movie_id]
		@movie = Movie.find(id_movie)
		id_moviegoer = params[:review][:moviegoer_id]
		@moviegoer = Moviegoer.find(id_moviegoer)
		@review = Review.new(review_params)
		@review.movie = @movie
		if @review.save
			redirect_to movie_path(@movie), notice: "A review has from #{@moviegoer.name} been successfully added to #{@movie.title}." 
		else
			render :new, status: :unprocessable_entity 
		end
	end
		
=begin
	def destroy
		id_movie = params[:movie_id]
		id_moviegoer = params[:review][:moviegoer_id]
		@movie = Movie.find(id)
		@movie.destroy
		flash[:notice] = "#{@movie.title} has been deleted."
		redirect_to movies_path
	end
=end

	def review_params
		params.require(:review).permit(:potatoes, :comments, :moviegoer_id)
	end
end