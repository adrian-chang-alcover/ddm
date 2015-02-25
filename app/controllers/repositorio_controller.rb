class RepositorioController < ApplicationController
  def index
    @directory = Dir.new(Rails.root.join('public', params[:path]))
  end
end
