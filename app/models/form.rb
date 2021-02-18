class Form < ApplicationRecord
validates :first_name, presence: true, length: {minimum: 1, maximum: 50}
validates :birth_date, presence: true, length: {minimum: 1, maximum: 10}
validates :something_about, length: {maximum: 140}
enum os: [:Windows, :Linux, :MacOS]
end
