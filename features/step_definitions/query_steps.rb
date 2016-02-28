Then(/^there should be no result$/) do
  expect(NoEquals::GetResult.execute).to be_nil
end
