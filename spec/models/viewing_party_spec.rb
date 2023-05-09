# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'validations' do
    it { should validate_presence_of :duration }
    it { should validate_numericality_of :duration }
    it { should validate_presence_of :time }
    it { should validate_presence_of :date }
    it { should validate_presence_of :movie_id }
    it { should validate_numericality_of :movie_id }
    it { should belong_to :user }
  end
end