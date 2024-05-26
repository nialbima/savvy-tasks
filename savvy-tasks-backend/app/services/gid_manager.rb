# frozen_string_literal: true

module GidManager

  module_function

  def get_gid(object:)
    object.to_gid_param
  end

  def get_object(global_id:)
    GlobalID::Locator.locate global_id
  end

  def get_objects(global_ids:, **kwargs)
    # This makes locate_many use .where instead of .find.
    default_locate_many_config = {ignore_missing: true}
    GlobalID::Locator.locate_many global_ids, **default_locate_many_config.merge(kwargs)
  end

  def extract_ids_from_gid_set(gids:)
    gids.each_with_object({}) do |gid, memo|
      uri = GlobalID.parse(gid)
      memo[uri.model_name] ||= []
      memo[uri.model_name] << uri.model_id.to_s
      memo
    end
  end
end
