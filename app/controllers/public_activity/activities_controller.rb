module PublicActivity
  class ActivitiesController < ApplicationController
    def index
      authorize! :read, :activities
      activity = PublicActivity::Activity
      unless params['user'].blank?
        activity = activity.where(owner_type: 'User', owner_id: params['user'].to_i)
      end
      unless params['entity'].blank?
        activity = activity.where(trackable_type: params['entity'])
      end
      @activities = activity.order(id: :desc).page(params[:page])
    end
  end
end
