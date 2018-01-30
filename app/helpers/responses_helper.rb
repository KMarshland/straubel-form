module ResponsesHelper

  def question(opts)

    if opts[:outside_answer]
      opts[:name] = "response[#{ opts[:name] }]"
    else
      opts[:name] = "response[answers][#{ opts[:name] }]"
    end

    opts[:type] = 'textarea' if opts[:type].blank?

    opts[:id] = "question-#{(0...16).map { ('a'..'z').to_a[rand(26)] }.join}"

    render partial: 'question', locals: opts
  end

end
