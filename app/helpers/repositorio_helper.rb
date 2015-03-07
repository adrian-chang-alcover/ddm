module RepositorioHelper
  def bfs_walk(directory, level=0)
    html = "<h#{3+level} style=\"margin-left: #{25*level}px;\">#{directory.name}</h#{3+level}>"
    html += "<ul style=\"margin-left: #{25*level}px;\">"
    directory.files.each do |file|
      html += "<li>"
      html += link_to file, File.join(directory.path.gsub(Rails.root.join('public').to_s,''), file)
      html += "</li>"
    end
    html += "</ul style=\"margin-left: #{25*level}px;\">"
    directory.directories.each do |dir|
      html += bfs_walk(Dir.new(File.join(directory, dir)), level + 1)
    end
    html
  end
end
