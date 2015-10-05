Dir.class_eval do
  def join(sub_directory)
    Dir.new(Pathname.new(self).join(sub_directory))
  end

  def directories
    self.entries.keep_if{|e| e != '.' and e != '..' and File.directory?(File.join(self, e))}
  end

  def files
    self.entries.keep_if{|e| File.file?(File.join(self, e))}
  end

  def name
    i = self.path.rindex('/') + 1
    self.path[i..-1]
  end

end
