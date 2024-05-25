class Task < ApplicationRecord
  # App-level validations can become really, really complicated. Wrapping shared behaviors with with_options is a decent
  # way of wrangling them when you don't want to write more-complex code for managing validation.
  with_options presence: true do
    validates :title
  end

  # Somewhat redundant, but this validation allows for better error handling in this case.
  # If we wound up doing this repeatedly, I'd extract it into a custom validator so that all the weirdness is
  # in one place.
  validates :completed, inclusion: { in: [true, false], message: :not_nil }, allow_nil: false

end
