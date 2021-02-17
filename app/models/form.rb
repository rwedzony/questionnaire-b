class Form < ApplicationRecord
validates :first_name, :birth_date,  presence: true
validates :something_about, length: {maximum: 140}
end
