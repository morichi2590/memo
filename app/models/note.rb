class Note < ApplicationRecord

acts_as_taggable
acts_as_taggable_on :skills, :interests

end
