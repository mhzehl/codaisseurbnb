require 'rails_helper'

RSpec.describe Room, type: :model do
  describe "validations" do
    it "is invalid without a home type" do
      room = Room.new(home_type: "")
      room.valid?
      expect(room.errors).to have_key(:home_type)
    end

    it "is invalid with a listing name longer than 50 characters" do
      room = Room.new(listing_name: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. ")
      room.valid?
      expect(room.errors).to have_key(:listing_name)
    end

    it "is valid without a price" do
      room = Room.new(price: "")
      room.valid?
      expect(room.errors).not_to have_key(:room)
    end
  end

  describe "#bargain?" do
    let(:user) { create :user }
    let(:bargain_room) { create :room, price: 20, user: user }
    let(:non_bargain_room) { create :room, price: 200, user: user }

    it "returns true if the price is smaller than 30 EUR" do
      expect(bargain_room.bargain?).to eq(true)
      expect(non_bargain_room.bargain?).to eq(false)
    end
  end

  describe "#order_by_price" do
    let(:user) { create :user }
    let!(:room1) { create :room, price: 100, user: user }
    let!(:room2) { create :room, price: 200, user: user }
    let!(:room3) { create :room, price: 300, user: user }

    it "returns a sorted array of rooms by prices" do
      expect(Room.order_by_price).to match_array [room1, room2, room3]
    end
  end

  describe "association with booking" do
    let(:guest_user) { create :user, email: "guest@user.com" }
    let(:host_user) { create :user, email: "host@user.com" }

    let!(:room) { create :room, user: host_user }
    let!(:booking) { create :booking, room: room, user: guest_user }

    it "has guests" do
      expect(room.guests).to include(guest_user)
    end
  end

  describe "#available?" do
    let(:host_user) { create :user, email: "host@user.com" }
    let(:guest_user) { create :user, email: "guest@user.com" }

    let(:room) { create :room, price: 20, user: host_user }

    let!(:existent_booking) { create :booking, room: room, starts_at: 2.days.from_now, ends_at: 6.days.from_now, user: guest_user }

    context "is available" do
      subject { room.available?(8.days.from_now, 10.days.from_now) }

      it "returns true" do
        expect(subject).to be true
      end
    end

    context "is not available" do
      subject { room.available?(4.days.from_now, 10.days.from_now) }

      it "returns false" do
        expect(subject).to be false
      end
    end
  end
end
