require_relative 'developer.rb'

class JuniorDeveloper < Developer

  MAX_TASKS = 5
  DEV_TYPE = :juniors

  @@working_text = 'пытаюсь делать задачу'

  def add_task(task)
    raise ArgumentError, 'Слишком сложно!' if task.length > 20
    super
  end

end