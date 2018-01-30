module FormHelper

  def question(title:,name:)

    render partial: 'question', locals: {
        title: title,
        name: name
    }

  end

end
