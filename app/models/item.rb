class Item < ApplicationRecord
    belongs_to :user, class_name: "User", optional: true

    scope :by_user, lambda {|user|
        where(:user_id => user.id)
    }

      # validations
      validates_presence_of :name
end
