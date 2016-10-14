# vi: set ft=ruby :

file_to_disk = Dir.pwd + '/large_disk.vdi'

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/xenial64'

  config.vm.provider 'virtualbox' do | v |
      unless File.exist?(file_to_disk)
          v.customize [
              'createhd',
              '--filename', file_to_disk,
              '--size', 10 * 1024
          ]
      end
      v.customize [
          'storageattach', :id,
          '--storagectl', 'SCSI Controller',
          '--port', 2,
          '--device', 0,
          '--type', 'hdd',
          '--medium', file_to_disk
      ]
  end

  config.vm.provision 'shell', inline: <<-SHELL
    apt-get update
    apt-get install -y bridge-utils vim tcpdump htop \
        zfs-zed docker.io

    docker pull debian
    zpool create -f tank /dev/sdc
  SHELL
end
