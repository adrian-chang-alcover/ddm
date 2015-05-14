module RepositorioHelper
  def bfs_walk(directory, level=0)
    html = "<a class=\"directory\" href=\"#\">"
    html += "<h#{2+level}>#{directory.name}</h#{2+level}>"
    html += "</a>"
    html += "<div>"
    html += "<ul data-level=\"#{level}\">"
    directory.files.sort.each do |file|
      html += "<li>"
      html += link_to file, File.join(directory.path.gsub(Rails.root.join('public').to_s,''), file)
      html += "</li>"
    end
    html += "</ul>"
    directory.directories.sort.each do |dir|
      html += bfs_walk(Dir.new(File.join(directory, dir)), level + 1)
    end
    html += "</div>"
    html
  end
end
