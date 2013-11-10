class Vote < ActiveRecord::Base
  belongs_to :choice, counter_cache: true
end
