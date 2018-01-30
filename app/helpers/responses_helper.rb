module ResponsesHelper

  def question(opts)

    if opts[:outside_answer]
      opts[:name] = "response[#{ opts[:name] }]"
    else
      opts[:name] = "response[answers][#{ opts[:name] }]"
    end

    opts[:type] = 'textarea' if opts[:type].blank?

    render partial: 'question', locals: opts
  end

end
