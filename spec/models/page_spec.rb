require 'rails_helper'

RSpec.describe Page, type: 'model' do
  context 'some test here' do
    let(:page) { Page.new }

    it 'has examples' do
      expect(page.full_url).to be "google.com"
    end

    it 'has examples' do
      expect(page.short_url).to be "google.com"
    end

  end
end
