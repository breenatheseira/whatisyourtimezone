class Timezone < ActiveRecord::Base
    belongs_to :user, inverse_of: :timezone
end
