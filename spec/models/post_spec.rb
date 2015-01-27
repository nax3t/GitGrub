require 'rails_helper'

RSpec.describe Post, type: :model do
	describe 'Attributes' do
		it { is_expected.to respond_to :place }
		it { is_expected.to respond_to :neighborhood }
		it { is_expected.to respond_to :time }
		it { is_expected.to respond_to :body }
    it { is_expected.to respond_to :user_id }
	end

  describe 'Database' do
  	it { is_expected.to have_db_column :place }
  	it { is_expected.to have_db_column :neighborhood }
  	it { is_expected.to have_db_column :time }
  	it { is_expected.to have_db_column :body }
    it { is_expected.to have_db_column :user_id }
  end

  describe 'Validations' do
  	it { is_expected.to validate_presence_of :place }
  	it { is_expected.to validate_presence_of :neighborhood }
  	it { is_expected.to validate_presence_of :time }
  	it { is_expected.to validate_presence_of :body }
    it { is_expected.to validate_presence_of :user_id }
  end
end
