require 'rails_helper'

RSpec.describe BiddingEngine do
  describe ".bid!" do
    it "create a new bid on an auction" do
      seller = User.create(:email => 'jane@doe.com', :password => 'pw1234' )
      bidder = User.create(:email => 'john@doe.com', :password => 'pw1234' )

      auction = Auction.create(title: 'Anything', description: 'Lorem ipsum',
                   start: DateTime.now, end: DateTime.now + 1.week,
                   user_id: seller.id)

      described_class.bid!(auction, 100, bidder)
      expect(auction.errors).to be_empty

      described_class.bid!(auction, 90, bidder)
      expect(auction.errors[:bid].first).to eq "must be bigger than the last bid on the auction"
    end
  end
end