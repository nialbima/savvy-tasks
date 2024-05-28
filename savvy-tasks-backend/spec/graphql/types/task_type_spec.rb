# frozen_string_literal: true

require "rails_helper"

RSpec.describe Types::TaskType, type: :graphql do
  describe "fields" do
    it "returns all fields" do
      freeze_time do
        task = create :task,
          title: "BRUSH TEETH",
          description: "Brush your teeth for 2 minutes, it's good for your health",
          completed: false,
          due_date: 1.day.from_now

        with_resolution_context(type: "Task", object: task, context: {}) do |rc|
          [
            ["gid", task.to_gid_param],
            ["title", "BRUSH TEETH"],
            ["description", "Brush your teeth for 2 minutes, it's good for your health"],
            ["completed", false],
            ["dueDate", 1.day.from_now.iso8601],
          ].each do |field_name, field_value|
            expect(rc.run_graphql_field(field_name)).to eq(field_value)
          end
        end
      end
    end
  end
end
