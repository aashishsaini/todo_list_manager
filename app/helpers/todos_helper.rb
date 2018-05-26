module TodosHelper
  def user_collection
    (Developer.pluck(:name, :id).compact) if Developer.count > 0
  end
end
