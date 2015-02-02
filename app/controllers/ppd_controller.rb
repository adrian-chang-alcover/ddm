class PpdController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:report, :export]

  def report
    if params[:career]
      @career = Career.find(params[:career])
    else
      @career = Career.first
    end
    respond_to do |format|
      format.html
      format.xls
    end
  end

  def export
    career = Career.find(params[:career])
    info = ExcelGenerator.export_ppd(career)
    send_file info[:file_name], info
  end
end
