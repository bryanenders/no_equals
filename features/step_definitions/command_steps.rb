When(/^I push '(.+)'$/) do |value|
  NoEquals::Push.execute(value.to_f)
end
