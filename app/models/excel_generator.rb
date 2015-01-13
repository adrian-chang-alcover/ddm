Spreadsheet::Worksheet.class_eval do
  def write(row, column, data, format=nil)
    self[row, column] = data unless data.blank?
    self.row(row).set_format(column, format) if format
  end
end

class ExcelGenerator

  WORKSHEET_HEADER = Spreadsheet::Format.new :pattern => 1, :pattern_fg_color => :silver, :size => 11, :color => :black, :align => :center, :vertical_align => :center

  def self.export_ppd(career)
    Dir.mkdir("#{Rails.root}/tmp/excels") unless Dir.exist?("#{Rails.root}/tmp/excels")
    file_name = "#{Rails.root}/tmp/excels/PPD_#{career.name}_#{Time.now.strftime('%Y%m%d.%H%M%S')}.xls"
    book = Spreadsheet::Workbook.new

    self.generate_presentation(book, career)

    book.write(file_name)
    {:file_name => file_name, :type => 'application/vnd.ms-excel'}
  end

  def self.generate_presentation(book, career)
    sheet = book.create_worksheet(name: 'PRESENTACION')

    start_column = 1
    start_row = 1
    width = 4
    sheet.column(start_column).width = 20
    sheet.merge_cells(start_row,start_column,start_row+1,start_column+width)
    sheet.write(start_row, start_column, 'UNIVERSIDAD DE LA HABANA', WORKSHEET_HEADER)
    row = start_row + 2
    {:facultad => career.faculty.name, :carrera => career.name, :curso => '2014-2015', :tipo_de_curso => 'CRD'}.each do |key, value|
      sheet.merge_cells(row, start_column, row+1,start_column)
      sheet.write(row, 1, key.to_s.upcase, WORKSHEET_HEADER)
      sheet.merge_cells(row,start_column+1,row+1,start_column+width)
      sheet.write(row, start_column+1, value, WORKSHEET_HEADER)
      row += 2
    end

    row += 2
    sheet.merge_cells(row,start_column,row,start_column+width)
    sheet.write(row,start_column,'PLAN DE ESTUDIOS', WORKSHEET_HEADER)
    sheet.write(row+=1,start_column,'AÑO',WORKSHEET_HEADER)
    sheet.write(row,start_column+1,'PLAN',WORKSHEET_HEADER)
    sheet.merge_cells(row, start_column+2,row,start_column+width)
    sheet.write(row,start_column+2,'COMENTARIOS',WORKSHEET_HEADER)
    career.years.each do |year|
      sheet.write(row+=1, start_column, year.pretty_name, WORKSHEET_HEADER)
      sheet.write(row, start_column+1, year.study_plan.name, Spreadsheet::Format.new(:align => :center))
      sheet.merge_cells(row, start_column+2,row,start_column+width)
    end
  end

end