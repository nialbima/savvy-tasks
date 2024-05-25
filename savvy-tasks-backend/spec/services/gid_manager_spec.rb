require "rails_helper"

RSpec.describe GidManager do
  describe ".get_gid" do
    it "sets a GID for a specific record" do
      task = create :task, :randomized
      gid = described_class.get_gid(object: task)
      expect(GlobalID.find(gid)).to eq task
    end

    it "returns the same GID when record data changes" do
      task = create :task, :randomized
      gid = described_class.get_gid(object: task)

      task.update!(title: "new title")
      new_gid = described_class.get_gid(object: task)

      expect(gid).to eq new_gid
    end
  end

  it "finds a specific record given a GID" do
    task = create :task, :randomized
    gid = task.to_gid_param
    expect(described_class.get_object(global_id: gid)).to eq task
  end

end
