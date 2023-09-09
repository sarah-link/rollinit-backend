# frozen_string_literal: true
Dir['./spec/support/**/*.rb'].sort.each { |f| require f }

RSpec.describe 'Creatures#show', type: :request do
  describe 'GET /show' do
    let!(:admin) { FactoryBot.create :user, id: 1, name: 'Admin' }
    let!(:creature) { FactoryBot.create :creature, { base_creature: true, user_id: admin.id } }

    context 'with an existing creature id' do
      before do
        get "/creatures/#{creature.id}"
      end

      it_behaves_like 'a successful response'

      it 'renders the creature' do
        expect(JSON.parse(response.body)).to eq(creature.as_json)
      end
    end

    context 'with a nonexistent creature id' do
      before { get '/creatures/99' }

      it_behaves_like 'a bad response'
    end
  end
end
