module FormHelper

  def question(opts)

    render partial: 'question', locals: opts

  end

end
