require "spec_helper"
require "bot"

describe Bot do
  subject { described_class.new({}) }
  let(:app) { subject }

  describe "ping" do
    it "responds to ping" do
      expect(message: "#{SlackRubyBot.config.user} ping")
        .to respond_with_slack_message("pong")
    end
  end

  describe "add" do
    let(:track) do
      double(
        "track",
        id: 1234,
        name: "Never Gonna Give You Up",
        artists: ["Rick Astley"]
      )
    end

    let(:searcher) { spy("searcher", call: [track]) }
    let(:player) { spy("player") }

    subject { described_class.curry[searcher, player] }

    before do
      Container.enable_stubs!
      Container.stub(:"actions.search_spotify", searcher)
      Container.stub(:"actions.add_song_to_sonos", player)
    end

    after do
      Container.unstub
    end

    it "queues up a song and lets you know" do
      expect(message: "#{SlackRubyBot.config.user} add Never Gonna Give You Up")
        .to respond_with_slack_message("Queued up Never Gonna Give You Up by Rick Astley")

      expect(player).to have_received(:call).with(track.id)
    end
  end
end
