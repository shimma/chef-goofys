#
# Cookbook Name:: goofys
# Attribute:: default
#
# Copyright 2017, Riki Shimma.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#

%w(fuse wget).each do |package|
  package "#{package}" do
    action :install
  end
end

directory "#{node['goofys']['s3_mount_path']}" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

bash 'install goofys' do
  not_if { ::File.exist?('/usr/local/bin/goofys') }
  code <<-EOC
    pushd /usr/local/bin
      wget https://github.com/kahing/goofys/releases/download/#{node['goofys']['binary_version']}/goofys
      chmod +x goofys
    popd
    echo "/usr/local/bin/goofys##{node['goofys']['s3_bucket_name']} #{node['goofys']['s3_mount_path']} fuse _netdev,auto,rw,allow_other,--use-content-type,--dir-mode=0700,--file-mode=0600,--uid=994,--gid=991 0 0" >>/etc/fstab
    mount -a
  EOC
end
