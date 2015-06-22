module RepositorioHelper
  def bfs_walk(directory, level=0)
    html = "<a class=\"directory\" href=\"#\">"
    html += "<h#{2+level}>#{directory.name}"
    html += " <span class=\"badge\">nuevo</span>" if File.stat(directory).mtime > 5.days.ago
    html += "</h#{2+level}>"
    html += "</a>"
    html += "<div>"
    html += "<ul data-level=\"#{level}\">"
    directory.files.sort.each do |file|
      file_path = File.join(directory.path.gsub(Rails.root.join('public').to_s,''), file)
      html += "<li>"
      html += "<a href=\"#{file_path}\">#{file}"
      html += " <span class=\"badge\">nuevo</span>" if File.stat(File.join(directory, file)).mtime > 5.days.ago
      html += "</a>"
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
