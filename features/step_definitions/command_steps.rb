When(/^I push '(.+)'$/) do |value|
  NoEquals::Push.execute(value.to_f)
end

When(/^I add$/) do
  NoEquals::Add.execute { |e| Cucumber::Log.report_error(e) }
end
