require_relative 'developer.rb'
require_relative 'seniordeveloper.rb'
require_relative 'juniordeveloper.rb'
require 'pp'

class Team

  attr_reader :seniors, :developers, :juniors

  def initialize(&block)
    @crew = {}
    @order = []
    @on_task_message = {}
    instance_eval &block
  end

  def all
   @crew.values.flatten
  end

  def priority(*levels)
    @order.push levels
    @order.flatten!
  end

  def add_task(task)
    @sorted_devs = all.select{|dev| dev.can_add_task?}.sort_by do |dev|
      [priority.index(dev.dev_type), dev.tasks.size]
    end
    active_dev = @sorted_devs.first
    active_dev.add_task(task)
    @on_task_message[s_remover_3000(active_dev)].call(active_dev, task) if @on_task_message[s_remover_3000(active_dev)]
  end

  def juniors
    @crew[:juniors]
  end

  def developers
    @crew[:developers]
  end

  def seniors
    @crew[:seniors]
  end

  def s_remover_3000 (dev)
     dev.dev_type.to_s[0...-1].to_sym
  end

  def report
    @sorted_devs.each do |dev|
      puts "#{dev.name.join} (#{s_remover_3000(dev)}): #{dev.tasks.join(' ')}"
      end
  end
  
  private

  def have_seniors(*devs)
    @seniors = []
    @crew[:seniors] = devs.map{|name| SeniorDeveloper.new(name)}
    #devs.map{|name| @seniors << SeniorDeveloper.new(name)}
  end

  def have_developers(*devs)
    @developers = []
    @crew[:developers] = devs.map{|name| Developer.new(name)}
  end

  def have_juniors(*devs)
    @juniors = []
    @crew[:juniors] = devs.map{|name| JuniorDeveloper.new(name)}
  end

  def on_task(dev, &block)
    @on_task_message[dev] = block
  end

end

team = Team.new {

  have_juniors "Владислава", "Аркадий", "Рамеш"
  have_developers "Олеся", "Василий", "Игорь-Богдан"
  have_seniors "Олег", "Оксана"
  priority :seniors, :developers, :juniors

  on_task :junior do |dev, task|
    puts "Отдали задачу #{task} разработчику #{dev.name}, следите за ним!"
  end

  on_task :senior do |dev, task|
    puts "#{dev.name} сделает #{task}, но просит больше с такими глупостями не приставать"
  end
}
