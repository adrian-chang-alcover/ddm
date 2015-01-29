class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity.where(trackable_type: 'Subject')
  end
end
