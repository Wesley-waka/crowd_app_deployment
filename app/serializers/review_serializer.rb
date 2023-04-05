class ReviewSerializer < ActiveModel::Serializers
  attributes :id, :comment, :user_id, :campaign_id, :rating
  belongs_to :user
end
