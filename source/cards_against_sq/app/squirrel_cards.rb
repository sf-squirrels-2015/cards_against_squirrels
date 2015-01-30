class Controller
  attr_accessor :current_list

  def add_list(list_name)
    List.create(name: list_name)
  end

  def delete_list(list_id)
    List.find(list_id).delete_self
  end

  def switch_list(list_name)
    @current_list = List.find_or_create_by(name: list_name)
  end

#   #gets broken up into parts
#   def list
#     task_list = Task.all
#     display_list(task_list)
#   end

end

