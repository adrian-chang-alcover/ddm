class ExcelGenerator

  def self.export_ppd(career)
    file_name = "#{Rails.root}/tmp/PPD_#{career.name}_#{Time.now.strftime('%Y%m%d.%H%M%S')}.xls"
    book = Spreadsheet::Workbook.new

    sheet = book.create_worksheet
    5.times {|j| 5.times {|i| sheet[j,i] = (i+1)*10**j}}

    book.write(file_name)
    {:file_name => file_name, :type => 'application/vnd.ms-excel'}
  end

end