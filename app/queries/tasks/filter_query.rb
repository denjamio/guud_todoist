module Tasks
  class FilterQuery
    def initialize(params = {})
      @user_id = params.fetch(:user_id)
      @from_date = params.fetch(:from_date, nil)
      @to_date = params.fetch(:to_date, nil)
      @priority = params.fetch(:priority, nil)
      @status = params.fetch(:status, nil)
      @tag_id = params.fetch(:tag_id, nil)
    end

    def call
      relation = filter_by_user(Task.all, user_id)
      relation = filter_by_dates(relation, from_date, to_date)
      relation = filter_by_priority(relation, priority)
      relation = filter_by_status(relation, status)
      relation = filter_by_tag(relation, tag_id)
      relation
    end

    private

    attr_reader :user_id, :from_date, :to_date, :priority, :status, :tag_id

    def filter_by_user(relation, user_id)
      relation.where(user_id: user_id)
    end

    def filter_by_dates(relation, from_date, to_date)
      if from_date && to_date
        relation.where(deadline: from_date..to_date)
      elsif from_date
        relation.where("deadline >= ?", from_date)
      elsif to_date
        relation.where("deadline <= ?", to_date)
      else
        relation
      end
    end

    def filter_by_priority(relation, priority)
      return relation unless priority
      relation.where(priority: priority)
    end

    def filter_by_status(relation, status)
      return relation unless status
      relation.where(status: status)
    end

    def filter_by_tag(relation, tag_id)
      return relation unless tag_id
      relation.joins(:tags).where(tags: {id: tag_id})
    end
  end
end