require "spec_helper"
require "actions/add_song_to_sonos"

module Actions
  describe AddSongToSonos do
    let(:system) { instance_spy(Sonos::System, speakers: [speaker]) }
    let(:speaker) { instance_spy(Sonos::Device::Speaker) }

    subject { described_class.curry[system] }

    let(:spotify_id) { "2CwulIyrmEYwbUWzcEVIhR" }

    describe ".call" do
      it "sends the spotify song to sonos" do
        subject.(spotify_id)
        expect(speaker)
          .to have_received(:add_spotify_to_queue)
          .with(spotify_id)
      end
    end
  end
end
