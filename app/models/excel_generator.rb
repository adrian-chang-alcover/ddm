class ExcelGenerator

  def self.export_ppd(career)
    Dir.mkdir("#{Rails.root}/tmp/excels") unless Dir.exist?("#{Rails.root}/tmp/excels")
    file_name = "#{Rails.root}/tmp/excels/PPD_#{career.name}_#{Time.now.strftime('%Y%m%d.%H%M%S')}.xls"
    book = Spreadsheet::Workbook.new

    sheet1 = book.create_worksheet(name: 'PRESENTACION')
    sheet1[1,1] = 'UNIVERSIDAD DE LA HABANA'
    sheet1[3,1] = 'FACULTAD:'
    sheet1[3,2] = career.name

    book.write(file_name)
    {:file_name => file_name, :type => 'application/vnd.ms-excel'}
  end

end