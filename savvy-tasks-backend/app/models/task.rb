class Task < ApplicationRecord
  # This is a new gem for me, but soft-deletion is REALLY common and I really like this approach. I've used modules attempting
  # to use default_scope or method overwrites to handle this, and they're always clunky. Discard steps around that by
  # just defining another method, instead. You still need to use a scope to look up the records, but the explicit
  # reference is preferable for me.
  include Discard::Model

  # App-level validations can become really, really complicated. Wrapping shared behaviors with with_options is a decent
  # way of wrangling them when you don't want to write more-complex code for managing validation.
  with_options presence: true do
    validates :title
  end

  # Somewhat redundant, but this validation allows for better error handling in this case.
  # If we wound up doing this repeatedly, I'd extract it into a custom validator so that all the weirdness is
  # in one place.
  validates :completed, inclusion: {in: [true, false], message: :not_nil}, allow_nil: false
end
