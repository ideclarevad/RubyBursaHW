require_relative 'developer.rb'

class SeniorDeveloper < Developer

  MAX_TASKS = 15

  def work!
    if [true, false].sample
      2.times {super}
      else puts 'Что-то лень'
    end
  end

end