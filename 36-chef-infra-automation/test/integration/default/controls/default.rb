control 'docker-service' do
  impact 1.0
  title 'Docker service is enabled and daemon config exists'

  describe file('/etc/docker/daemon.json') do
    it { should exist }
  end
end
