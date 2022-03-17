class MoviegoersController < ApplicationController
	def index
		@moviegoers = Moviegoer.all
	end
	
	def show
		id = params[:id]
		@moviegoer = Moviegoer.find(id)
	end
	
	def new
		@moviegoer = Moviegoer.new
	end
	
	def create
		@moviegoer = Moviegoer.new(moviegoer_params)
		if @moviegoer.save
			redirect_to @moviegoer, notice: "Moviegoer was successfully created." 
		else
			render :new, status: :unprocessable_entity
		end
	end
	
	def destroy
		id = params[:id]
		@moviegoer = Moviegoer.find(id)
		@moviegoer.destroy
		flash[:notice] = "#{@moviegoer.name} has been deleted."
		redirect_to moviegoers_path
	end

	private

	def moviegoer_params
		params.require(:moviegoer).permit(:name)
	end
end