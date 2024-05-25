class GidManager
  # It's highly likely that we're going to need to create properly secure global IDs for the front-end.
  # So I'm pulling that functionality out of the schema. It's a little bit wordier, but
  # keeps the schema from potentially doing too much, so it feels worthwhile. Worst case scenario, we have a simple class
  # that handles something specific.

  def self.get_gid(object:)
    object.to_gid_param
  end

  def self.get_object(global_id:)
    GlobalID.find(global_id)
  end
end
