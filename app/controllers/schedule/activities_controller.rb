module Schedule
  class ActivitiesController < ApplicationController
    before_action :set_schedule_activity, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    respond_to :html

    def index
      @schedule_activities = Activity.all
      respond_with(@schedule_activities)
    end

    def show
      respond_with(@schedule_activity)
    end

    def new
      @schedule_activity = Activity.new
      respond_with(@schedule_activity)
    end

    def edit
    end

    def create
      @schedule_activity = Activity.new(activity_params)
      @schedule_activity.save
      respond_with(@schedule_activity)
    end

    def update
      @schedule_activity.update(activity_params)
      respond_with(@schedule_activity)
    end

    def destroy
      @schedule_activity.destroy
      respond_with(@schedule_activity)
    end

    private
      def set_schedule_activity
        @schedule_activity = Activity.find(params[:id])
      end

      def schedule_activity_params
        params.require(:schedule_activity).permit(:professor_id, :subject_id, :group_id, :local_id, :docent_day_id, :turn_id, :turn_type_id)
      end
  end
end