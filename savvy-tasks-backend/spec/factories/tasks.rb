FactoryBot.define do
  factory :task do
    user
    title { "A Task" }
    description { "WHAT EVEN IS THIS, MAN, OH GOOD WHAT NOW" }
    # Static dates in tests can cause issues when dealing with scheduled events. Making it dynamic from jump is easier,
    # as long as you use freeze_time aggressively.
    due_date { 4.days.from_now }

    # I like randomized records in traits because it lets me create as many unique records as I want without doing any
    # extra work. You can also do this with sequences, but I think it's better to use random seeds to avoid cases where
    # things like title length or contents might need to be managed. You can also do this with sequences, but I've
    # had trouble with complexity when you need to track down twelve separate sequence definitions. This keeps it right
    # in the factory.
    trait :randomized do
      title { "Learn #{FFaker::Skill.unique.specialty}" }
    end
  end
end
