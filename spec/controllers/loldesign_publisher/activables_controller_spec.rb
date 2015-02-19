require 'spec_helper'

describe LoldesignPublisher::ActivablesController, type: :controller do
  describe '#create' do
    let!(:user){ create(:user) }

    before{ post(:create, resource_name: 'User', id: user.id) }

    it{expect(user.reload.active).to be true}  
    it{expect(response.body).to eq("{\"message\":\"User - 1 activated.\"}")}
  end

  describe '#destroy' do
    let!(:user){ create(:user, :actived) }

    before{ delete(:destroy, resource_name: 'User', id: user.id) }

    it{expect(user.reload.active).to be false}  
    it{expect(response.body).to eq("{\"message\":\"User - 1 inactivated.\"}")}
  end
end