class ParserController < ApplicationController
  def ppd_vivo
    File.open('project/PPD vivo.txt').readlines.each do |line|
      row = line.chomp.split("\t")
      discipline, career, foo, class_hours, practical_hours, year, semester, curriculum, foo, evaluation = row
    end
  end
end
