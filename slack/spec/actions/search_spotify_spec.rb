require "actions/search_spotify"

module Actions
  describe SearchSpotify do
    let(:track_repo) { class_spy(RSpotify::Track, search: results) }
    let(:results) { [1, 2, 3, 4, 5, 6] }

    subject { described_class.curry[track_repo] }

    describe ".call" do
      it "Returns the first three tracks" do
        expect(subject.("David Bowie")).to eq [1, 2, 3]
        expect(track_repo).to have_received(:search).with("David Bowie")
      end
    end
  end
end
