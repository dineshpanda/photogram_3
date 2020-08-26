require 'rails_helper'

RSpec.describe PhotoResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'photos',
          attributes: attributes_for(:photo)
        }
      }
    end

    let(:instance) do
      PhotoResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Photo.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:photo) { create(:photo) }

    let(:payload) do
      {
        data: {
          id: photo.id.to_s,
          type: 'photos',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      PhotoResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { photo.reload.updated_at }
      # .and change { photo.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:photo) { create(:photo) }

    let(:instance) do
      PhotoResource.find(id: photo.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Photo.count }.by(-1)
    end
  end
end
