module ResponsesHelper

  def question(opts)
    render partial: 'question', locals: opts
  end

end
