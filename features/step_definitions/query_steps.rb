Then(/^there should be no result$/) do
  expect(NoEquals::GetResult.execute).to be_nil
end

Then(/^the result should be '(.+)'$/) do |value|
  expect(NoEquals::GetResult.execute).to eq(value.to_f)
end
