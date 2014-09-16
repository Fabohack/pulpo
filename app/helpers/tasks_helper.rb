module TasksHelper
   # Returns an array of numbers options suitable for use in
  # a select helper.
  def estimated_time_options
    (1..8).collect do |numbers|
      [I18n.t('n numbers_et', :count => numbers), numbers]
    end
  end
  # Returns an array of numbers options suitable for use in
  # a select helper.
  def completed_time_options
    (0..8).collect do |numbers|
      [I18n.t('n numbers_ct', :count => numbers), numbers]
    end
  end
  
  # Returns an array of options suitable for use in
  # a select helper.
  def sequence_options
    (1..12).collect do |numb|
      [I18n.t('n sequence', :count => numb), numb]
    end
  end
  
  def diferencia(task)
    task.estimated_time - task.completed_time
  end
end
