Spreadsheet::Worksheet.class_eval do
  def write(row, column, data, format=nil)
    self[row, column] = data unless data.blank?
    self.row(row).set_format(column, format) if format
  end
end

class ExcelGenerator

  TABLE_HEADER = Spreadsheet::Format.new :pattern => 1, :pattern_fg_color => :silver, :size => 11, :color => :black, :align => :center, :vertical_align => :center
  PPD_HEADER = Spreadsheet::Format.new :size => 11, :color => :black, :align => :center, :vertical_align => :center
  CENTER = Spreadsheet::Format.new :align => :center, :vertical_align => :center

  def self.export_ppd(career)
    Dir.mkdir("#{Rails.root}/tmp/excels") unless Dir.exist?("#{Rails.root}/tmp/excels")
    file_name = "#{Rails.root}/tmp/excels/PPD_#{career.name}_#{Time.now.strftime('%Y%m%d.%H%M%S')}.xls"
    book = Spreadsheet::Workbook.new

    self.generate_presentation(book, career)
    self.generate_ppd(book, career)

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
    sheet.write(start_row, start_column, 'UNIVERSIDAD DE LA HABANA', TABLE_HEADER)
    row = start_row + 2
    {:facultad => career.faculty.name, :carrera => career.name, :curso => '2014-2015', :tipo_de_curso => 'CRD'}.each do |key, value|
      sheet.merge_cells(row, start_column, row+1,start_column)
      sheet.write(row, 1, key.to_s.upcase, TABLE_HEADER)
      sheet.merge_cells(row,start_column+1,row+1,start_column+width)
      sheet.write(row, start_column+1, value, TABLE_HEADER)
      row += 2
    end

    row += 2
    sheet.merge_cells(row,start_column,row,start_column+width)
    sheet.write(row,start_column,'PLAN DE ESTUDIOS', TABLE_HEADER)
    sheet.write(row+=1,start_column,'AÑO',TABLE_HEADER)
    sheet.write(row,start_column+1,'PLAN',TABLE_HEADER)
    sheet.merge_cells(row, start_column+2,row,start_column+width)
    sheet.write(row,start_column+2,'COMENTARIOS',TABLE_HEADER)
    career.years.each do |year|
      sheet.write(row+=1, start_column, year.pretty_name, TABLE_HEADER)
      sheet.write(row, start_column+1, year.study_plan.name, Spreadsheet::Format.new(:align => :center))
      sheet.merge_cells(row, start_column+2,row,start_column+width)
    end
  end

  def self.generate_ppd(book, career)
    sheet = book.create_worksheet(name: 'PPD')

    start_column = 0
    start_row = 0
    row = start_row

    sheet

    ['REPUBLICA DE CUBA','MINISTERIO DE EDUCACIÓN SUPERIOR','UNIVERSIDAD  DE  LA  HABANA','PLAN DEL PROCESO DOCENTE VIGENTE','CURSO 2014-2015'].each do |head|
      sheet.merge_cells(row,start_column,row,start_row+11)
      sheet.write(row,start_column,head,PPD_HEADER)
      row+=1
    end

    sheet.write(row+=1,start_column,'MODALIDAD: PRESENCIAL')
    sheet.merge_cells(row,start_column+3,row,start_column+6)
    sheet.merge_cells(row,start_column+8,row,start_column+11)
    sheet.write(row+=1,start_column,"CARRERA: #{career.name}")
    sheet.merge_cells(row,start_column+3,row,start_column+6)
    sheet.merge_cells(row,start_column+8,row,start_column+11)
    sheet.write(row,start_column+3,"Decano de #{career.name}",CENTER)
    sheet.write(row,start_column+8,"Dr. GUSTAVO COBREIRO",CENTER)
    sheet.write(row+=1,start_column,"CALIFICACIÓN: Licenciado en #{career.name}")
    sheet.merge_cells(row,start_column+3,row,start_column+6)
    sheet.merge_cells(row,start_column+8,row,start_column+11)
    sheet.write(row,start_column+3,'DECANO',CENTER)
    sheet.write(row,start_column+8,'RECTOR',CENTER)
  end

end