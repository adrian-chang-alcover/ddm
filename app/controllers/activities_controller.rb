class ActivitiesController < ApplicationController
  def index
    unless params['user'].blank?
      @activities = PublicActivity::Activity.where(trackable_type: params['entity'], owner_type: 'User', owner_id: params['user'])
    else
      @activities = PublicActivity::Activity.where(trackable_type: params['entity'])
    end
  end
end
