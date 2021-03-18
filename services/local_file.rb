class LocalFile
  def written?(file)
    File.exist?(file) && File.size(file) > 0
  end

  def write(file, data)
    File.open(file, 'w+') do |f|
      f.write(data)
    end
  end

  def read(file)
    file = File.open(file)
    data = file.read
    file.close
    JSON.parse(data)
  end
end
