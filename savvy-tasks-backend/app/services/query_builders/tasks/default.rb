module QueryBuilders
  module Tasks
    module IndexList
      def for(user:)
        user.tasks.kept
      end
    end
  end
end
