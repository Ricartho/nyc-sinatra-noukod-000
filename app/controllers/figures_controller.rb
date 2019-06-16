class FiguresController < ApplicationController
  # add controller methods
  get "/figures" do
    @figures = Figure.all
    erb "/figures/index".to_sym
  end

  get "/figures/new" do
    @titles = Title.all
    @landmarks = Landmark.all
    erb "/figures/new".to_sym
  end

  post "/figures" do
    figure = Figure.create(params[:figure])
    figure.landmarks << Landmark.create(params[:landmark]) if !params[:landmark].empty?
    figure.titles << Title.create(params[:title]) if !params[:title].empty?
    redirect to "/figures/#{figure.id}"
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb "/figures/show".to_sym
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])
    erb "/figures/edit".to_sym
  end

  patch "/figures/:id" do
    @figure = Figure.find_by_id(params[:id])
    @figure.name = params[:figure][:name]
    @figure.landmarks << Landmark.create(params[:landmark])
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end
