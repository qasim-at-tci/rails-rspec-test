require 'rails_helper'

RSpec.describe Auction, type: :model do
  let(:seller) {
    User.new(:email => "jane@doe.com", :password => "pw1234")
  }

  subject {
    described_class.new(title:"Anything",
                        description:"Lorem Ipsum",
                        start: DateTime.now,
                        end: DateTime.now + 1.week,
                        user_id: 1)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a start date" do
    subject.start = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an end date" do
    subject.end = nil
    expect(subject).to_not be_valid
  end

  describe "Associations" do
    it { should belong_to(:user).without_validating_presence }
    it { should have_many(:bids) }
  end
end
