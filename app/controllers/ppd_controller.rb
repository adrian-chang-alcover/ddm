class PpdController < ApplicationController
  def report
    if params[:career]
      @career = Career.find(params[:career])
    else
      @career = Career.first
    end
  end

  def export

  end
end
