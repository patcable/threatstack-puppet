require 'spec_helper'

describe 'threatstack::configure' do

  deploy_key = ENV['TS_DEPLOY_KEY'] ? ENV['TS_DEPLOY_KEY'] : "xKkRzesqg"
  ts_hostname = 'test-host'

  context 'on Debian' do
    let(:facts) { {:osfamily => 'Debian'} }
    let(:pre_condition) { "class { 'threatstack': deploy_key => '#{deploy_key}', ts_hostname => '#{ts_hostname}', ruleset => ['Default Ruleset', 'Service Ruleset'] }" }

    it { should contain_exec('threatstack-agent-setup').with(
      :command => "/opt/threatstack/bin/cloudsight setup --deploy-key='#{deploy_key}' --hostname='#{ts_hostname}'  --ruleset='Default Ruleset' --ruleset='Service Ruleset' "
    )}
  end

end
