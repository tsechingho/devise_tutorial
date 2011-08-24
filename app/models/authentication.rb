class Authentication < ActiveRecord::Base
  validates :provider, :uid, :presence => true

  belongs_to :resource, :polymorphic => true
end
