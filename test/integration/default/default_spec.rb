describe upstart_service('gpsd') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port(2947) do
  its('protocols') { should include 'tcp' }
  its('addresses') { should include '127.0.0.1' }
end

describe command('kismet --version') do
  its('stdout') { should match /^Kismet 201.*/ }
  its('exit_status') { should eq 1 }
end
