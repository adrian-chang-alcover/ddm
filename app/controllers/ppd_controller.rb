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
    file = File.open(info[:file_name])
    send_file file.path, info
    file.close
  end
end
