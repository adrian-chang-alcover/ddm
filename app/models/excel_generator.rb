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

    sheet.column(start_column).width = 5
    sheet.column(start_column+1).width = 50
    (2..11).each{|i| sheet.column(i).width = 7}

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

    row += 2
    sheet.merge_cells(row,start_column,row+3,start_column)
    sheet.merge_cells(row,start_column+1,row+3,start_column+1)
    sheet.merge_cells(row,start_column+2,row,start_column+4)
    sheet.merge_cells(row,start_column+5,row,start_column+6)
    sheet.merge_cells(row,start_column+7,row,start_column+career.years.count+6)
    sheet.write(row,start_column,'No',TABLE_HEADER)
    sheet.write(row,start_column+1,'Disciplina y Asigantura',TABLE_HEADER)
    sheet.write(row,start_column+2,'Cantidad de horas',TABLE_HEADER)
    sheet.write(row,start_column+5,'Dist. por años',TABLE_HEADER)
    sheet.write(row,start_column+7,'Dist. de las horas por años',TABLE_HEADER)
    row += 1
    (2..11).each do |i|
      sheet.merge_cells(row,start_column+i,row+2,start_column+i)
    end
    sheet.write(row,start_column+2,'TOTAL',TABLE_HEADER)
    sheet.write(row,start_column+3,'CLASE',TABLE_HEADER)
    sheet.write(row,start_column+4,'PL',TABLE_HEADER)
    sheet.write(row,start_column+5,'EF',TABLE_HEADER)
    sheet.write(row,start_column+6,'TC',TABLE_HEADER)
    career.years.each_with_index do |year, i|
      sheet.write(row,start_column+7+i,year.name,TABLE_HEADER)
    end

    row += 3
    CurriculumType.all.each do |ct|
      sheet.merge_cells(row,start_column,row,start_column+11)
      sheet.write(row,start_column,ct.name.upcase,CENTER)
      row += 1
      career.disciplines.each_with_index do |d, i|
        if d.subjects_by_curriculum_type(ct).any?
          sheet.write(row,start_column,i+1,TABLE_HEADER)
          sheet.write(row,start_column+1,d.name,TABLE_HEADER)
          sheet.write(row,start_column+2,d.subjects_by_curriculum_type(ct).sum(&:total_hours),TABLE_HEADER)
          sheet.write(row,start_column+3,d.subjects_by_curriculum_type(ct).sum(&:class_hours),TABLE_HEADER)
          sheet.write(row,start_column+4,d.subjects_by_curriculum_type(ct).sum(&:practical_hours),TABLE_HEADER)
          sheet.write(row,start_column+5,d.subjects_by_curriculum_type_and_evaluation_type(ct, ApplicationController::EVALUATION_TYPE_EXAMEN_FINAL).count,TABLE_HEADER)
          sheet.write(row,start_column+6,d.subjects_by_curriculum_type_and_evaluation_type(ct, ApplicationController::EVALUATION_TYPE_TRABAJO_CURSO).count,TABLE_HEADER)
          career.years.each_with_index do |year, y|
            sheet.write(row,start_column+7+y,d.subjects_by_year(year).sum(&:total_hours),TABLE_HEADER)
          end
          row += 1
          d.subjects_by_curriculum_type(ct).each_with_index do |s, j|
            sheet.write(row, start_column, (i+1) + (j+1).fdiv(100),CENTER)
            sheet.write(row, start_column+1, s.name)
            sheet.write(row, start_column+2, s.total_hours,CENTER)
            sheet.write(row, start_column+3, s.class_hours,CENTER)
            sheet.write(row, start_column+4, s.practical_hours,CENTER)
            sheet.write(row, start_column+5, s.year.name,CENTER) if s.evaluation_type == ApplicationController::EVALUATION_TYPE_EXAMEN_FINAL
            sheet.write(row, start_column+6, s.year.name,CENTER) if s.evaluation_type == ApplicationController::EVALUATION_TYPE_TRABAJO_CURSO
            sheet.write(row, start_column+7+s.career.years.to_a.find_index(s.year), s.total_hours,CENTER)
            row += 1
          end
        end
      end
    end
  end

end