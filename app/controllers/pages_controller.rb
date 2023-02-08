class PagesController < ApplicationController
  require "ruby/openai"

  def api_request
    prompt = params[:prompt]
    client = OpenAI::Client.new(access_token: "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")
    client.models.list
    client.models.retrieve(id: "text-ada-001")
    response = client.completions(
      parameters: {
          model: "text-davinci-001",
          prompt: prompt,
          max_tokens: 100
      })
      render json: JSON.parse(response.body)["choices"].map { |c| c["text"].delete("\n\n") }
  end

end
