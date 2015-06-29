module RepositorioHelper
	def new?(path)
		File.stat(path).mtime > 5.days.ago
	end
end