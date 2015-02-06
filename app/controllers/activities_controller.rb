class ActivitiesController < ApplicationController
  def index
    authorize! :read, :activities
    @activities = PublicActivity::Activity.all.to_a
    unless params['user'].blank?
      @activities = @activities.select{|a| a.owner_type == 'User' and a.owner_id == params['user'].to_i}
    end
    unless params['entity'].blank?
      @activities = @activities.select{|a| a.trackable_type == params['entity']}
    end
    @activities
  end
end
