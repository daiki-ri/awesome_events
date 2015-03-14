class UserEventsController < ApplicationController
    before_action :authenticate
    def new
        raise ActionController::RoutingError, 'ログイン状態で UserEventsController#new にアクセス'
    end
    def create
        user_event = current_user.user_events.build do |t|
            t.event_id = params[:event_id]
            t.comment = params[:user_event][:comment]
        end
        if user_event.save
            flash[:notice] = 'このイベントに参加しました'
            head 201
        else
            render json: { messages: user_event.errors.full_messages }, status: 422
        end
    end
    def destroy
        user_event = current_user.user_events.find_by!(event_id: params[:event_id])
        user_event.destroy!
        redirect_to event_path(params[:event_id]), notice: 'このイベントの参加をキャンセルしました'
    end
end
