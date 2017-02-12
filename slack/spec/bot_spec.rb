require "bot"

describe Bot do
  it "responds to ping" do
    expect(message: "#{SlackRubyBot.config.user} ping").to respond_with_slack_message('pong')
  end
end
