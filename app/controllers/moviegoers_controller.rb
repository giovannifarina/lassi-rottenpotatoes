class MoviegoersController < ApplicationController
	def index
		@moviegoers = Moviegoer.all
	end
	
	def show
		id = params[:id]
		@moviegoer = Moviegoer.find(id)
	end
	
	def new
		#default rendering
	end
	
	def create
		@moviegoer = Moviegoer.create!(params[:moviegoer].permit(:name))
		flash[:notice] = "#{@moviegoer.name} was successfully created."
		redirect_to moviegoers_path
	end
	
	def destroy
		id = params[:id]
		@moviegoer = Moviegoer.find(id)
		@moviegoer.destroy
		flash[:notice] = "#{@moviegoer.name} has been deleted."
		redirect_to moviegoers_path
	end
end