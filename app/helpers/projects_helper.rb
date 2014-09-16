module ProjectsHelper
  # Returns an array of valid iteration length options suitable for use in
  # a select helper.
  def iteration_length_options
    (1..12).collect do |months|
      [I18n.t('n months', :count => months), months]
    end
  end
end
