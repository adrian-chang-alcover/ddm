Spreadsheet::Worksheet.class_eval do
  def write(row, column, data, format=nil)
    self[row, column] = data unless data.blank?
    self.row(row).set_format(column, format) if format
  end
end

Spreadsheet::Format.class_eval do
  def | (format)
    defaults = {:@rotation         => 0,
                :@pattern          => 0,
                :@bottom_color     => :black,
                :@top_color        => :black,
                :@left_color       => :black,
                :@right_color      => :black,
                :@diagonal_color   => :black,
                :@pattern_fg_color => :border,
                :@pattern_bg_color => :pattern_bg}
    result = Spreadsheet::Format.new
    [self, format].each do |f|
      f.instance_variables.each do |instance_variable|
        unless instance_variable == :@font
          if f.instance_variable_get(instance_variable) and (not defaults.key?(instance_variable) or f.instance_variable_get(instance_variable) != defaults[instance_variable])
            result.instance_variable_set(instance_variable, f.instance_variable_get(instance_variable))
          end
        end
      end
      f.font.instance_variables.each do |instance_variable|
        if f.font.instance_variable_get(instance_variable)
          result.font.instance_variable_set(instance_variable, f.font.instance_variable_get(instance_variable))
        end
      end
    end
    result
  end
end

class ExcelGenerator

  CENTER = Spreadsheet::Format.new :align => :center, :vertical_align => :center
  LEFT = Spreadsheet::Format.new :align => :left
  TINY = Spreadsheet::Format.new :size => 7
  NORMAL = Spreadsheet::Format.new :size => 9
  HUGE = Spreadsheet::Format.new :size => 11
  BG_COLOR = Spreadsheet::Format.new :pattern => 1, :pattern_fg_color => :silver
  TABLE_HEADER = CENTER | NORMAL | BG_COLOR

  CURRICULUM_TYPE_BASICO = ApplicationController::CURRICULUM_TYPE_BASICO
  CURRICULUM_TYPE_PROPIO = ApplicationController::CURRICULUM_TYPE_PROPIO
  CURRICULUM_TYPE_OPTATIVO = ApplicationController::CURRICULUM_TYPE_OPTATIVO

  EVALUATION_TYPE_EXAMEN_FINAL = ApplicationController::EVALUATION_TYPE_EXAMEN_FINAL
  EVALUATION_TYPE_TRABAJO_CURSO = ApplicationController::EVALUATION_TYPE_TRABAJO_CURSO

  def self.export_ppd(career)
    Dir.mkdir("#{Rails.root}/tmp/excels") unless Dir.exist?("#{Rails.root}/tmp/excels")
    file_name = "#{Rails.root}/tmp/excels/PPD_#{career.name}_#{Time.now.strftime('%Y%m%d.%H%M%S')}.xls"
    book = Spreadsheet::Workbook.new

    self.generate_presentation(book, career)
    self.generate_ppd(book, career)
    self.generate_ppd_vivo(book, career)
    self.generate_malla_curricular(book, career)

    book.write(file_name)
    {:file_name => file_name, :type => 'application/vnd.ms-excel'}
  end

  def self.generate_header(sheet, start_row, start_column, width, career)
    row = start_row

    ['REPUBLICA DE CUBA','MINISTERIO DE EDUCACIÓN SUPERIOR','UNIVERSIDAD  DE  LA  HABANA','PLAN DEL PROCESO DOCENTE VIGENTE','CURSO 2014-2015'].each do |head|
      sheet.merge_cells(row,start_column,row,start_row+width)
      sheet.write(row,start_column,head,CENTER | HUGE)
      row+=1
    end

    sheet.merge_cells(row+=1,start_column,row,start_column+width-9)
    sheet.write(row,start_column,'MODALIDAD: PRESENCIAL',TINY)
    sheet.merge_cells(row,start_column+width-8,row,start_column+width-5)
    sheet.merge_cells(row,start_column+width-3,row,start_column+width)
    sheet.merge_cells(row+=1,start_column,row,start_column+width-9)
    sheet.write(row,start_column,"CARRERA: #{career.name}",TINY)
    sheet.merge_cells(row,start_column+width-8,row,start_column+width-5)
    sheet.merge_cells(row,start_column+width-3,row,start_column+width)
    sheet.write(row,start_column+width-8,career.faculty.dean,CENTER|TINY)
    sheet.write(row,start_column+width-3,"Dr. Gustavo J Cobreiro Suárez",CENTER|TINY)
    sheet.merge_cells(row+=1,start_column,row,start_column+width-9)
    sheet.write(row,start_column,"CALIFICACIÓN: Licenciado en #{career.name}",TINY)
    sheet.merge_cells(row,start_column+width-8,row,start_column+width-5)
    sheet.merge_cells(row,start_column+width-3,row,start_column+width)
    sheet.write(row,start_column+width-8,'DECANO',CENTER)
    sheet.write(row,start_column+width-3,'RECTOR',CENTER)
    row
  end

  def self.generate_presentation(book, career)
    sheet = book.create_worksheet(name: 'PRESENTACION')

    start_column = 1
    start_row = 1
    width = 4
    sheet.column(start_column).width = 20
    sheet.merge_cells(start_row,start_column,start_row+1,start_column+width)
    sheet.write(start_row, start_column, 'UNIVERSIDAD DE LA HABANA', TABLE_HEADER | HUGE)
    row = start_row + 2
    {:facultad => career.faculty.name, :carrera => career.name, :curso => '2014-2015', 'tipo de curso' => 'CRD'}.each do |key, value|
      sheet.merge_cells(row, start_column, row+1,start_column)
      sheet.write(row, 1, key.to_s.upcase, TABLE_HEADER | HUGE)
      sheet.merge_cells(row,start_column+1,row+1,start_column+width)
      sheet.write(row, start_column+1, value, TABLE_HEADER | HUGE)
      row += 2
    end

    row += 2
    sheet.merge_cells(row,start_column,row,start_column+width)
    sheet.write(row,start_column,'PLAN DE ESTUDIOS', TABLE_HEADER | HUGE)
    sheet.write(row+=1,start_column,'AÑO',TABLE_HEADER | HUGE)
    sheet.write(row,start_column+1,'PLAN',TABLE_HEADER | HUGE)
    sheet.merge_cells(row, start_column+2,row,start_column+width)
    sheet.write(row,start_column+2,'COMENTARIOS',TABLE_HEADER)
    career.years.each do |year|
      sheet.write(row+=1, start_column, year.pretty_name, TABLE_HEADER)
      sheet.write(row, start_column+1, year.study_plan.name, CENTER|NORMAL)
      sheet.merge_cells(row, start_column+2,row,start_column+width)
    end
  end

  def self.generate_ppd(book, career)
    sheet = book.create_worksheet(name: 'PPD')

    start_column = 0
    start_row = 0

    sheet.column(start_column).width = 5
    sheet.column(start_column+1).width = 30
    (2..6+career.years.count).each{|i| sheet.column(i).width = 5}

    row = self.generate_header(sheet,start_row,start_column,6+career.years.count,career)

    row += 2
    sheet.merge_cells(row,start_column,row+3,start_column)
    sheet.merge_cells(row,start_column+1,row+3,start_column+1)
    sheet.merge_cells(row,start_column+2,row,start_column+4)
    sheet.merge_cells(row,start_column+5,row,start_column+6)
    sheet.merge_cells(row,start_column+7,row,start_column+career.years.count+6)
    sheet.write(row,start_column,'No',TABLE_HEADER)
    sheet.write(row,start_column+1,'Disciplina y Asigantura',TABLE_HEADER)
    sheet.write(row,start_column+2,'Cantidad de horas',TABLE_HEADER|TINY)
    sheet.write(row,start_column+5,'Dist. por años',TABLE_HEADER|TINY)
    sheet.write(row,start_column+7,'Dist. de las horas por años',TABLE_HEADER|TINY)
    row += 1
    (2..6+career.years.count).each do |i|
      sheet.merge_cells(row,start_column+i,row+2,start_column+i)
    end
    sheet.write(row,start_column+2,'TOTAL',TABLE_HEADER|TINY)
    sheet.write(row,start_column+3,'CLASE',TABLE_HEADER|TINY)
    sheet.write(row,start_column+4,'PL',TABLE_HEADER)
    sheet.write(row,start_column+5,'EF',TABLE_HEADER)
    sheet.write(row,start_column+6,'TC',TABLE_HEADER)
    career.years.each_with_index do |year, i|
      sheet.write(row,start_column+7+i,year.name,TABLE_HEADER)
    end

    row += 3
    CurriculumType.all.each do |ct|
      sheet.merge_cells(row,start_column,row+1,start_column+6+career.years.count)
      sheet.write(row,start_column,ct.name.upcase,CENTER | HUGE)
      row += 2
      career.disciplines.each_with_index do |d, i|
        if d.subjects_by_curriculum_type(ct).any?
          sheet.write(row,start_column,i+1,TABLE_HEADER)
          sheet.write(row,start_column+1,d.name,TABLE_HEADER|LEFT|TINY)
          sheet.write(row,start_column+2,d.subjects_by_curriculum_type(ct).sum(&:total_hours),TABLE_HEADER)
          sheet.write(row,start_column+3,d.subjects_by_curriculum_type(ct).sum(&:class_hours_1),TABLE_HEADER)
          sheet.write(row,start_column+4,d.subjects_by_curriculum_type(ct).sum(&:practical_hours),TABLE_HEADER)
          sheet.write(row,start_column+5,d.subjects_by_curriculum_type_and_evaluation_type(ct, EVALUATION_TYPE_EXAMEN_FINAL).count,TABLE_HEADER)
          sheet.write(row,start_column+6,d.subjects_by_curriculum_type_and_evaluation_type(ct, EVALUATION_TYPE_TRABAJO_CURSO).count,TABLE_HEADER)
          career.years.each_with_index do |year, y|
            sheet.write(row,start_column+7+y,d.subjects_by_curriculum_type_and_year(ct,year).sum(&:total_hours),TABLE_HEADER)
          end
          row += 1
          d.subjects.each_with_index do |s, j|
            if s.curriculum_type == ct
              sheet.write(row, start_column, (i+1) + (j+1).fdiv(100),CENTER | TINY)
              sheet.write(row, start_column+1, s.name, TINY)
              sheet.write(row, start_column+2, s.total_hours,CENTER | TINY)
              sheet.write(row, start_column+3, s.class_hours_1,CENTER | TINY)
              sheet.write(row, start_column+4, s.practical_hours,CENTER | TINY)
              sheet.write(row, start_column+5, s.year.name,CENTER | TINY) if s.evaluation_type == EVALUATION_TYPE_EXAMEN_FINAL
              sheet.write(row, start_column+6, s.year.name,CENTER | TINY) if s.evaluation_type == EVALUATION_TYPE_TRABAJO_CURSO
              sheet.write(row, start_column+7+s.career.years.to_a.find_index(s.year), s.total_hours,CENTER | TINY)
              row += 1
            end
          end
          row += 1
        end
      end

      (row..row+2).each{|i| (0..6+career.years.count).each{|j| sheet.write(i,j,'',TABLE_HEADER) }}
      sheet.merge_cells(row,start_column,row+2,start_column)
      sheet.write(row,start_column,'TOTAL',TABLE_HEADER|TINY)
      sheet.write(row,start_column+1,"HORAS DEL CURRÍCULO #{ct.name.upcase} POR FORMA Y AÑO",TABLE_HEADER | TINY | LEFT)
      sheet.write(row+1,start_column+1,"EXÁMENES FINALES DEL CURRÍCULO #{ct.name.upcase}",TABLE_HEADER | TINY | LEFT)
      sheet.write(row+2,start_column+1,"TRABAJOS DE CURSO DEL CURRÍCULO #{ct.name.upcase}",TABLE_HEADER | TINY | LEFT)
      sheet.write(row,start_column+2,career.subjects_by_curriculum_type(ct).sum(&:total_hours),TABLE_HEADER)
      sheet.write(row,start_column+3,career.subjects_by_curriculum_type(ct).sum(&:class_hours_1),TABLE_HEADER)
      sheet.write(row,start_column+4,career.subjects_by_curriculum_type(ct).sum(&:practical_hours),TABLE_HEADER)
      sheet.write(row+1,start_column+5,career.subjects_by_curriculum_type(ct).count{|s| s.evaluation_type == EVALUATION_TYPE_EXAMEN_FINAL},TABLE_HEADER)
      sheet.write(row+2,start_column+6,career.subjects_by_curriculum_type(ct).count{|s| s.evaluation_type == EVALUATION_TYPE_TRABAJO_CURSO},TABLE_HEADER)
      career.years.each_with_index do |year, y|
        sheet.write(row, start_column+7+y,career.subjects_by_curriculum_type_and_year(ct,year).sum(&:total_hours),TABLE_HEADER)
      end
      row += 3
    end

    sheet.merge_cells(row,start_column,row+1,start_column+11)
    sheet.write(row,start_column,'TOTALES',CENTER | HUGE)
    row += 2
    (row..row+3).each{|i| (0..6+career.years.count).each{|j| sheet.write(i,j,'',BG_COLOR) }}
    sheet.merge_cells(row,start_column,row+2,start_column)
    sheet.write(row,start_column,'TOTAL',TABLE_HEADER | TINY)
    sheet.write(row,start_column+1,"HORAS DEL CURRÍCULO POR FORMA Y POR AÑO",TABLE_HEADER | TINY | LEFT)
    sheet.write(row+1,start_column+1,"EXÁMENES FINALES DEL CURRÍCULO Y POR AÑO",TABLE_HEADER | TINY | LEFT)
    sheet.write(row+2,start_column+1,"TRABAJOS DE CURSO DEL CURRÍCULO Y POR AÑO",TABLE_HEADER | TINY | LEFT)
    sheet.write(row,start_column+2,career.subjects.sum(&:total_hours),TABLE_HEADER)
    sheet.write(row,start_column+3,career.subjects.sum(&:class_hours_1),TABLE_HEADER)
    sheet.write(row,start_column+4,career.subjects.sum(&:practical_hours),TABLE_HEADER)
    sheet.write(row+1,start_column+5,career.subjects.count{|s| s.evaluation_type == EVALUATION_TYPE_EXAMEN_FINAL},TABLE_HEADER)
    sheet.write(row+2,start_column+6,career.subjects.count{|s| s.evaluation_type == EVALUATION_TYPE_TRABAJO_CURSO},TABLE_HEADER)
    career.years.each_with_index do |year, y|
      sheet.write(row, start_column+7+y,career.subjects_by_year(year).sum(&:total_hours),TABLE_HEADER)
    end

    row += 4
    sheet.merge_cells(row, start_column+1,row,start_column+2)
    sheet.write(row, start_column+1,'ESTRUCTURA EN PORCIENTO',TABLE_HEADER)
    sheet.write(row+1, start_column+1,'CURRÍCULO BÁSICO',TABLE_HEADER|LEFT)
    sheet.write(row+1, start_column+2,(career.subjects_by_curriculum_type(CURRICULUM_TYPE_BASICO).sum(&:total_hours).fdiv(career.subjects.sum(&:total_hours))*100).round(2),TABLE_HEADER)
    sheet.write(row+2, start_column+1,'CURRÍCULO PROPIO',TABLE_HEADER|LEFT)
    sheet.write(row+2, start_column+2,(career.subjects_by_curriculum_type(CURRICULUM_TYPE_PROPIO).sum(&:total_hours).fdiv(career.subjects.sum(&:total_hours))*100).round(2),TABLE_HEADER)
    sheet.write(row+3, start_column+1,'CURRÍCULO OPTATIVO',TABLE_HEADER|LEFT)
    sheet.write(row+3, start_column+2,(career.subjects_by_curriculum_type(CURRICULUM_TYPE_OPTATIVO).sum(&:total_hours).fdiv(career.subjects.sum(&:total_hours))*100).round(2),TABLE_HEADER)

    sheet.merge_cells(row,start_column+6,row,start_column+6+career.years.count)
    sheet.write(row,start_column+6,'EVALUACIONES POR AÑO',TABLE_HEADER)
    row += 1
    career.years.each_with_index do |year, y|
      sheet.write(row,start_column+6+y,year.name,TABLE_HEADER)
    end
    sheet.write(row,start_column+6+career.years.count,'TOTAL',TABLE_HEADER | TINY)
    sheet.write(row+=1, start_column+5,'EF',TABLE_HEADER)
    career.years.each_with_index do |year, y|
      sheet.write(row,start_column+6+y,career.subjects_by_year(year).count{|s|s.evaluation_type==EVALUATION_TYPE_EXAMEN_FINAL},TABLE_HEADER)
    end
    sheet.write(row,start_column+6+career.years.count,career.subjects_by_evaluation_type(EVALUATION_TYPE_EXAMEN_FINAL).count,TABLE_HEADER)
    sheet.write(row+=1, start_column+5,'TC',TABLE_HEADER)
    career.years.each_with_index do |year, y|
      sheet.write(row,start_column+6+y,career.subjects_by_year(year).count{|s|s.evaluation_type==EVALUATION_TYPE_TRABAJO_CURSO},TABLE_HEADER)
    end
    sheet.write(row,start_column+6+career.years.count,career.subjects_by_evaluation_type(EVALUATION_TYPE_TRABAJO_CURSO).count,TABLE_HEADER)
    sheet.write(row+=1, start_column+5,'TOTAL',TABLE_HEADER | TINY)
    career.years.each_with_index do |year, y|
      sheet.write(row,start_column+6+y,career.subjects_by_year(year).count{|s|s.evaluation_type},TABLE_HEADER)
    end
    sheet.write(row,start_column+6+career.years.count,career.subjects.count{|s|s.evaluation_type},TABLE_HEADER)
  end

  def self.generate_ppd_vivo(book, career)
    sheet = book.create_worksheet(name: 'PPD VIVO')

    start_column = 0
    start_row = 0
    row = start_row

    (0..9).each{|column| sheet.column(column).width=5}
    sheet.column(start_column).width=30
    sheet.column(start_column+1).width=30
    sheet.column(start_column+9).width=30
    ['DISCIPLINA', 'ASIGNATURA', 'TH',	'HC', 'HP', 'AÑO', 'SE',	'CU', 'EV.',	'DICTÁMEN O RESOLUCIÓN'].each_with_index do |header, i|
      sheet.write(row, start_column+i,header,TABLE_HEADER)
    end

    row += 1
    career.disciplines.each do |discipline|
      sheet.write(row,start_column,discipline.name,TINY)
      discipline.subjects.each do |subject|
        sheet.write(row,start_column+1,subject.name,TINY)
        sheet.write(row,start_column+2,subject.total_hours,CENTER|TINY)
        sheet.write(row,start_column+3,subject.class_hours_1,CENTER|TINY)
        sheet.write(row,start_column+4,subject.practical_hours,CENTER|TINY)
        sheet.write(row,start_column+5,subject.year.name,CENTER|TINY)
        sheet.write(row,start_column+6,subject.semester.name,CENTER|TINY)
        sheet.write(row,start_column+7,subject.curriculum_type.name,CENTER|TINY)
        sheet.write(row,start_column+8,subject.evaluation_type.short_name, CENTER|TINY) if subject.evaluation_type
        sheet.write(row,start_column+9,subject.dictum_or_resoluteness,CENTER|TINY)
        row += 1
      end
    end

  end

  def self.generate_malla_curricular(book, career)
    sheet = book.create_worksheet(name: 'MALLA CURRICULAR')

    start_column = 0
    start_row = 0
    (0..13).each{|i| sheet.column(i).width = 5}

    row = self.generate_header(sheet,start_row,start_column,13,career)

    row += 2
    career.years.each do |year|
      sheet.merge_cells(row,start_column,row,start_column+13)
      sheet.write(row,start_column,year.pretty_name.titleize,TABLE_HEADER|HUGE)
      row += 1
      year.semesters.select{|s| not s.anual?}.each_with_index do |semester, s|
        sheet.merge_cells(row,start_column+5*s,row,start_column+5*s+3)
        sheet.write(row,start_column+5*s,semester.pretty_name.titleize,TABLE_HEADER|HUGE)
        sheet.column(start_column+5*s).width=30
        sheet.write(row+1,start_column+5*s,'ASIGNATURA',TABLE_HEADER)
        sheet.write(row+1,start_column+5*s+1,'EVAL',TABLE_HEADER)
        sheet.write(row+1,start_column+5*s+2,'H',TABLE_HEADER)
        sheet.write(row+1,start_column+5*s+3,'H / S',TABLE_HEADER)

        total_hours = 0
        semester.subjects.to_a.concat(semester.relevant_subjects).each_with_index do |subject, sub|
          sheet.write(row+2+sub,start_column+5*s,subject.name,TINY)
          sheet.write(row+2+sub,start_column+5*s+1,subject.evaluation_type.short_name,CENTER) if subject.evaluation_type
          hours = if semester.practica?
                    subject.practical_hours
                  elsif subject.semester.anual?
                    case semester.name_slug
                      when '1'
                        subject.class_hours_1
                      when '2'
                        subject.class_hours_2
                    end
                  else
                    subject.class_hours_1
                  end
          sheet.write(row+2+sub,start_column+5*s+2,hours,CENTER)
          total_hours += hours
          sheet.write(row+2+sub,start_column+5*s+3,hours.fdiv(semester.weeks).round(2),CENTER)
        end
        total_subjects = semester.subjects.count + semester.relevant_subjects.count
        i=2
        {'TOTAL DE SEMANAS'=>semester.weeks,'TOTAL DE HORAS'=>total_hours,'PROMEDIO DE HORAS SEMANALES'=>total_hours.fdiv(semester.weeks).round(2),'TOTAL DE EXÁMENES'=>semester.subjects.to_a.count{|s|s.evaluation_type==ApplicationController::EVALUATION_TYPE_EXAMEN_FINAL}}.each do |key,value|
          sheet.merge_cells(row+i+total_subjects,start_column+5*s,row+i+total_subjects,start_column+5*s+1)
          sheet.write(row+i+total_subjects,start_column+5*s,key,BG_COLOR|NORMAL)
          sheet.write(row+i+total_subjects,start_column+5*s+2,value,BG_COLOR|CENTER|NORMAL)
          i+=1
        end
      end
      row += year.semesters.collect{|s| s.subjects.count + s.relevant_subjects.count}.max + 7
    end
  end
end