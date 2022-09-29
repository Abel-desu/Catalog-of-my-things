module LabelModule
  def read_labels
    if @labels.empty?
      puts 'No labels has been added yet, please add it.'
    else
      @labels.each_with_index do |label, index|
        puts "#{index + 1}) #{label.title} #{label.color}"
      end
    end
  end

  def save_labels
    label_hash = []
    @labels.each do |label|
      label_hash << {
        title: label.title,
        color: label.color
      }
    end
    File.open('./db/labels.json', 'w') { |f| f.puts label_hash.to_json }
  end

  def load_labels
    label_file = File.exist?('./db/labels.json') ? File.read('./db/labels.json') : '[]'
    label_h = JSON.parse(label_file)
    label_h.each do |label|
      @labels << Label.new(label['title'], label['color'])
    end
  end
end
