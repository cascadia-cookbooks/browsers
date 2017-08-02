require 'spec_helper'

describe 'cop_browsers::chrome' do
    describe package('google-chrome-stable') do
        it { should be_installed }
    end

    describe file('/usr/bin/chrome') do
        it { should be_symlink }
    end

    describe command('chrome --version') do
        its(:stdout) { should match /6[0-9]\./ }
    end

    case os[:family]
    when 'ubuntu', 'debian'
        describe file('/etc/apt/sources.list.d/chrome.list') do
            it { should be_file }
            it { should be_owned_by 'root' }
            it { should be_mode '644' }
        end
    when 'redhat'
        describe file('/etc/yum.repos.d/chrome.repo') do
            it { should be_file }
            it { should be_owned_by 'root' }
            it { should be_mode '644' }
        end
    end
end
