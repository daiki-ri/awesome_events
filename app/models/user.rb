class User < ActiveRecord::Base
    before_destroy :check_all_events_finished
    has_many :created_events, class_name: 'Event', foreign_key: :owner_id
    has_many :user_events
    has_many :events, :through => :user_events
    def self.find_or_create_from_auth_hash(auth_hash)
        provider = auth_hash[:provider]
        if provider == 'facebook'
            uid = auth_hash[:uid]
            nickname = auth_hash[:info][:name]
            image_url = auth_hash[:info][:image]
        elsif provider == 'twitter'
            uid = auth_hash[:uid]
            nickname = auth_hash[:info][:nickname]
            image_url = auth_hash[:info][:image]
        end

        User.find_or_create_by(provider: provider, uid: uid) do |user|
            user.nickname = nickname
            user.image_url = image_url
        end
    end

    private
    def check_all_events_finished
        now = Time.zone.now
        if created_events.where(':now < end_time', now: now).exists?
            errors[:base] << '公開中の未終了イベントが存在します。'
        end
        errors.blank?
    end
end
