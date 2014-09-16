module StatisticsHelper

#estados {'ACTIVE'=>1,'CLOSED'=>2,'OLD'=>3,'CUTTED'=>4,'IN PROGRESS'=>5}

	def calculate_statistics(tasks)
		sum_estimation_task=0
#		puts "sum_estimation_task = #{sum_estimation_task}"
		sum_completed_task=0
#		puts "sum_completed_task = #{sum_completed_task}"
		sum_task=0
#		puts "sum_task = #{sum_task}"
		i=0
		tasks.each do |task|
#			puts "--------------------"
#			puts "task.subject: #{task.subject}"
			sum_estimation_task+=task.estimated_time
#			puts "sum_estimation_time = #{task.estimated_time}"
#			puts "sum_estimation_task = #{sum_estimation_task}"
			sum_completed_task+=task.completed_time
#			puts "sum_completed_time = #{sum_completed_task}"
#			puts "task.state = #{task.state}"
			case (task.state)
			when 1
				sum_task+=task.estimated_time
			when 2
				sum_task+=task.completed_time
			when 5
				sum_task+=(task.completed_time+task.remaining_time)
			end
		end
#		puts "======================="
#		puts 'total'
#		puts sum_completed_task
#		puts sum_task
		percent_task=sum_completed_task.to_f/sum_task.to_f
		puts "%5.2f" % percent_task 
		puts "percent_task= #{percent_task.round(3)}"
		return percent_task.round(3)
	end

	def calculate_estimates_task(tasks)
		sum_task=0
		tasks.each do |task|
			sum_task+=task.estimated_time
		end
		return sum_task
	end

	def calculate_completed_task(tasks)
		sum_task=0
		tasks.each do |task|
			sum_task+=task.completed_time
		end
		return sum_task
	end

	def calculate_remaining_task(tasks)
		sum_task=0
		tasks.each do |task|
			sum_task+=task.remaining_time
		end
		return sum_task
	end
end
