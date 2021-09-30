class Evaluation < ApplicationRecord

    belongs_to :user
    belongs_to :lecture, optional: true

end
