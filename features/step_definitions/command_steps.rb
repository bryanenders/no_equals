log_error = ->(e) { Cucumber::Log.report_error(e) }

When(/^I push '(.+)'$/) do |value|
  NoEquals::Push.execute(value.to_f)
end

When(/^I add$/) do
  NoEquals::Add.execute(&log_error)
end

When(/^I subtract$/) do
  NoEquals::Subtract.execute(&log_error)
end

When(/^I multiply$/) do
  NoEquals::Multiply.execute(&log_error)
end

When(/^I divide$/) do
  NoEquals::Divide.execute(&log_error)
end
