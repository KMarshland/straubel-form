QUESTIONS = YAML.load_file("#{Rails.root.to_s}/config/questions.yml")

QUESTIONS = QUESTIONS.map {|name, value|
  value = {
      title: value
  } if value.is_a? String

  value[:name] = name

  [name, value]
}.to_h.with_indifferent_access