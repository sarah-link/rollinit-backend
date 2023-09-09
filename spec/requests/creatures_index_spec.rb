# frozen_string_literal: true

require 'rails_helper'
Dir['./spec/support/**/*.rb'].sort.each { |f| require f }

RSpec.describe 'Creatures#index', type: :request do
  describe 'GET /index' do
    let!(:admin) { FactoryBot.create :user, id: 1, name: 'Admin' }
    let!(:active_user) { FactoryBot.create :user }
    let!(:other_user) { FactoryBot.create :user  }
    let!(:base_creatures) { FactoryBot.create_list :creature, 3, { base_creature: true, user_id: 1 } }

    context 'a good request' do
      before(:each) do
        get '/creatures', params: { user_id: active_user.id }
      end

      context 'when no custom creatures exist' do
        it_behaves_like 'a successful response'

        it 'returns the base creatures' do
          expect(JSON.parse(response.body)).to eq(base_creatures.as_json)
        end
      end

      context 'when custom creatures exist, but not for user' do
        let!(:creature) { FactoryBot.create :creature, user_id: other_user.id }

        it_behaves_like 'a successful response'

        it 'returns the base creatures only' do
          expect(JSON.parse(response.body)).to eq(base_creatures.as_json)
        end
      end

      context 'when custom creatures exist for user' do
        let!(:creature) { FactoryBot.create :creature, user_id: active_user.id }

        it_behaves_like 'a successful response'

        it 'returns the base creatures and custom creatures' do
          get '/creatures', params: { user_id: 2 }
          body = JSON.parse(response.body)
          expect(body.include?(creature.as_json))
          expect(body.include?(base_creatures.as_json))
        end
      end
    end

    context 'a bad request' do
      context 'without a user_id' do
        before { get '/creatures' }

        it_behaves_like 'a bad response'
      end

      context 'with a nonexistent user_id' do
        before { get '/creatures', params: { user_id: 0 } }

        it_behaves_like 'a bad response'
      end
    end
  end
end
