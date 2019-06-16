class LandmarksController < ApplicationController
  # add controller methods

  get "/landmarks" do
    @landmarks = Landmark.all
    erb "/landmarks/index".to_sym
  end

  get "/landmarks/new" do
    erb "/landmarks/new".to_sym
  end

  post "/landmarks" do
    landmark = Landmark.create(params[:landmark])
    redirect to "/landmarks/#{landmark.id}"
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find_by_id(params[:id])
    erb "/landmarks/show".to_sym
  end

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find_by_id(params[:id])
    erb "/landmarks/edit".to_sym
  end

  patch "/landmarks/:id" do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.name = params[:landmark][:name]
    @landmark.year_completed = params[:landmark][:year_completed]
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end
end
