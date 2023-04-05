class PledgeSerializer < ActiveModel::Serializers
  attributes :id, :pledge_amount, :user_id, :campaign_id
end
