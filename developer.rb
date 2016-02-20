class Developer

  MAX_TASKS = 10

  def max_tasks
    self.class::MAX_TASKS
  end

  def initialize(name)
    @name = name
    @tasks = []
  end

  def add_task(task)
    raise 'Слишком много работы!' unless can_add_task?
    @tasks << task
    puts %Q{#{@name}: добавлена задача "#{task}"}
  end
  
  def tasks
    @tasks.each.with_index(1).map {|task, index| "#{index}. #{task}"}
  end

  @@working_text = 'выполнена задача'

  def work!
    is_tasks_empty?
    puts %Q{#{@name}: #{@@working_text} "#{@tasks.shift}". Осталось задач: #{@tasks.count}}
  end

  def status
    case
      when @tasks.empty?
        'Свободен'
      when can_work?
        'Работаю'
      when can_add_task? == false
        'Занят'
    end
  end

  def can_add_task?
    @tasks.count < max_tasks
  end

  def can_work?
    @tasks.count > 0 && @tasks.count < max_tasks
  end

  def is_tasks_empty?
    raise ArgumentError, 'Нечего делать!' if @tasks.empty?
  end

end