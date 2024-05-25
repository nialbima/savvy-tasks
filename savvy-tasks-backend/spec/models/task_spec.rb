require "rails_helper"

RSpec.describe Task, type: :model do
  # I use these in testing to provide a descriptive verification of core behavior in a class. It basically just confirms
  # that everything we expect a class to do is, in fact, what that class does. When something changes, you get a failure,
  # even when it's a piece of high-level class behavior that might otherwise be overlooked. It lets the tests serve
  # as good documentation, and makes it clearer for new devs.

  # Also, a lot of my peers have told me that it feels like overtesting, and there's some truth to that. I like having
  # tests that confirm that our classes are structured the way we wanted, but the line between doing that and annoying my
  # coworkers has to be carefully managed.
  specify :aggregate_failures do
    described_class = create :task, :randomized
    # If this fails, nothing's going to work, so having it fail in a predictable place makes it simpler to learn how
    # the class behaves.
    expect(described_class).to validate_presence_of :title
    expect(described_class).to validate_inclusion_of(:completed).in_array([true, false]).with_message("must be defined")
  end

  describe "#validations" do
    it "validates title presence" do
      task = build :task, title: nil
      expect(task.valid?).to eq false
      expect(task.errors.full_messages).to match_array(["Title can't be blank"])
    end

    it "validates non-nil values for completed" do
      task = build :task, completed: nil
      expect(task.valid?).to eq false
      expect(task.errors.full_messages).to match_array(["Completed must be defined"])
    end
  end
end
