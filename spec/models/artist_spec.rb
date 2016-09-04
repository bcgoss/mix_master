require 'rails_helper'

RSpec.describe Artist, type: :model do
  context "validattions" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:image_path) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
