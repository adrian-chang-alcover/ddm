class InsertUniversities < ActiveRecord::Migration
  def change
  	univerities = [['UC', 'Universidad de Camagüey'],
				  ['UNICA',	'Universidad de Ciego de Ávila'],
				  ['UCf',	'Universidad de Cienfuegos'],
				  ['UDG',	'Universidad de Granma'],
				  ['UG',	'Universidad de Guantánamo'],
				  ['UHOLM',	'Universidad de Holguín'],
				  ['UH',	'Universidad de La Habana'],
				  ['ULT',	'Universidad de Las Tunas'],
				  ['UMCC',	'Universidad de Matanzas'],
				  ['UNAH',	'Universidad Agraria'],
				  ['UPR',	'Universidad de Pinar del Río'],
				  ['UNISS',	'Universidad de Santi Spiritus'],
				  ['UO',	'Universidad de Oriente'],
				  ['UCLV',	'Universidad Central de las Villas'],
				  ['UIJ',	'Universidad de la Isla de la Juventud'],
				  ['UAR',	'Universidad de Artemisa']]
		univerities.each do |univ|
			University.find_or_create_by(short_name: univ[0], full_name: univ[1])
		end			  
  end
end
