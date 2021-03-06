RSpec.describe Acme::Authorizer::TokensController do
  describe '#show' do
    context 'with valid token' do
      let(:token) { 'valid_token' }
      let(:key_authorization) { 'authorization' }
      before do
        Acme::Authorizer.configure do |config|
          config.add_token(token, key_authorization)
        end
        get :show, params: { token: token }
      end
      it 'renders key authorization' do
        expect(response.body).to eq key_authorization
      end
    end
    context 'with invalid token' do
      before do
        get :show, params: { token: 'invalid_token' }
      end
      it { expect(response.status).to eq 404 }
    end
  end
end
