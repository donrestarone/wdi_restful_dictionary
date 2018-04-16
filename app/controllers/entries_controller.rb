class EntriesController < ApplicationController
	
	def index 
		@entries = Entry.all
		render :index
	end 

	def show 
		@entry = Entry.find(params[:id])
		render :show
	end 

	def new 
		@entry = Entry.new 
		render :new 
	end 

	def create 
		@entry = Entry.new 
		@entry.word = params[:entry][:word]
		@entry.definition = params[:entry][:definition]
		@entry.language = params[:entry][:langauge]
 
		if @entry.save
			redirect_to entries_path
		else 
			render :new
		end 
	end 

	def edit 
		@entry = Entry.find(params[:id])
		render :edit
	end 

	def update 
		@entry = Entry.find(params[:id])

		@entry.word = params[:entry][:word]
		@entry.definition = params[:entry][:definition]
		@entry.language = params[:entry][:language]

		if @entry.save
			redirect_to entry_path(params[:id])
		else 
			render :index
		end 
	end	 

	def destroy
		@entry = Entry.find(params[:id])
		@entry.destroy
		redirect_to entries_url
	end 
end
