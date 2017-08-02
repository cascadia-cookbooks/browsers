#
# Cookbook Name:: browsers
# Recipe:: chrome
#

case node['platform_family']
when 'debian'
    apt_repository 'chrome' do
        uri          'https://dl.google.com/linux/chrome/deb/'
        key          'https://dl.google.com/linux/linux_signing_key.pub'
        # NOTE: remove distro from repo file
        distribution ''
        components   ['stable', 'main']
    end

    execute 'update apt' do
        command 'apt-get update'
        action  :nothing
    end
when 'rhel'
    yum_repository 'chrome' do
        description 'Google Linux packages'
        baseurl     'https://dl.google.com/linux/chrome/rpm/stable/$basearch/'
        enabled     true
        gpgcheck    true
        gpgkey      'https://dl.google.com/linux/linux_signing_key.pub'
        action      :create
    end
end

package 'google-chrome-stable' do
    action :install
end

link '/usr/bin/chrome' do
    to '/usr/bin/google-chrome-stable'
end
