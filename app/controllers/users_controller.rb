class UsersController < ApplicationController
    before_action :authenticate, except: [:show, :owner_events]

    def show 
        @user = User.find(params[:id])

        @user_events = @user.events.page(params[:page]).per(PER).order(:start_time).reverse_order
    end

    def owner_events
        @user = User.find(params[:user_id])
        @user_events = @user.created_events.page(params[:page]).per(PER).order(:start_time).reverse_order
    end

    def retire
    end

    def destroy
        if current_user.destroy
            reset_session
            redirect_to root_path, notice: '退会しました'
        else
            render :retire
        end
    end
end
