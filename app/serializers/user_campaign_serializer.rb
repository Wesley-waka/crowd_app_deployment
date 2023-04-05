class UserCampaignSerializer < ActiveModel::Serializers
  attributes :id, :username, :email 

  has_many :reviews
end
