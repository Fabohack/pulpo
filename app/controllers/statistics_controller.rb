class StatisticsController < ApplicationController
  def show
  	@projects = Project.all
  end

  def details

  end

  def calculate_statistics
  #  	@proyecto = Project.find(1)
  #  	@tareas = @proyecto.tasks  	
	@projects = Project.all
	@projects.each do |project|
		sum_estimates=calculate_estimates_task(project.tasks)
	end

  end
end
