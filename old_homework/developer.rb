class Developer

  attr_reader :name
  MAX_TASKS = 10
  DEV_TYPE = :developers

  @@working_text = 'выполнена задача'

  def max_tasks
    self.class::MAX_TASKS
  end

  def dev_type
    self.class::DEV_TYPE
  end

  def initialize(*name)
    @name = name
    @tasks = []
  end

  def add_task(task)
    raise 'Слишком много работы!' unless can_add_task?
    @tasks << task
    puts %Q{#{@name}: добавлена задача "#{task}". Всего в списке задач: #{@tasks.length}}

  end
  
  def tasks
    @tasks.each.with_index(1).map {|task, index| "#{index}. #{task}"}
  end

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
      when !can_add_task?
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