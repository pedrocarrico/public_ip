# Put your step definitions here

require 'ipaddress'

Then(/^the output should be a valid ip address$/) do
  puts last_command_started.output
  expect(IPAddress.valid?(last_command_started.output)).to be_truthy
end
