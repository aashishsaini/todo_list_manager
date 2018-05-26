module ProjectsHelper
  def statuses(projects)
    projects.uniq.map(&:todos).flatten.map(&:status).uniq
  end

  def developer_results
    collection = {}
    statuses(@projects).each do |status|
      collection.merge!({status => []})
      @projects.uniq.each do |project|
        collection[status].push(project.todos.where(status: status, user: current_user))
      end
    end
    collection
  end

  def admin_results
    collection = {}
    statuses(@projects).each do |status|
      collection.merge!({status => []})
      @projects.map(&:users).flatten.uniq.each do |user|
        collection[status].push({user.name => user.todos.where(status: status)})
      end
    end
    collection
  end

  def get_charts
    todos = @projects ? @projects.map(&:todos) : (@todos ? @todos : @project.todos)
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Status' )
    data_table.new_column('number', 'Number of Todos')

    # Add Rows and Values
    data_table.add_rows(todos.flatten.group_by(&:status).map{|k,v| [k , v.count] })
    option = { width: 400, height: 240, title: 'Health Report' }
    @chart = GoogleVisualr::Interactive::PieChart.new(data_table, option)
  end
end
