package 'curl'
package 'git'

file '/etc/motd' do
  content "Managed by Chef
"
  mode '0644'
end
