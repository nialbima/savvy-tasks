FactoryBot.define do
  factory :task do
    trait :randomized do
      title do
        skill = FFaker::Skill.unique.specialty
        "Google #{skill} until it makes sense"
      end

      description { "WHAT EVEN IS THIS, MAN, OH GOD WHAT NOW" }
      due_date { 4.days.from_now }
    end
  end
end
