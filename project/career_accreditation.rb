accreditation_categories = ["Carrera de Excelencia", "Carrera Certificada","Carrera Autorizada"]
accreditation_categories.each do |ac|
	AccreditationCategory.find_or_create_by(name: ac)
end	
