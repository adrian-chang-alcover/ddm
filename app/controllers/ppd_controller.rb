class PpdController < ApplicationController
  def report
    if params[:career]
      @career = Career.find(params[:career])
    else
      @career = Career.first
    end
  end

  def export
    career = Career.find(params[:career])
    info = ExcelGenerator.export_ppd(career)
    send_file info[:file_name], info
  end
end
