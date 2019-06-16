class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do

  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb '/figures/new'.to_sym
  end
end
