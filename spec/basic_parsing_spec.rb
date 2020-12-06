RSpec.describe logs() do
    it { is_expected.to all( include_json(tags: [ "app_log" ]) ) }
    it { is_expected.to all( include_json(env: /^(dev|int|test|prod)$/) ) }
    it { is_expected.to all( include_json(loglevel: /^(trace|debug|info|warn|error|critical)$/) ) }
    it { expect(logs).not_to include( include_json(tags: [ "_grokparserfailure" ]) ) }
end