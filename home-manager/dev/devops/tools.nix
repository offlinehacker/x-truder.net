# admin devops profile defines tools for administrating databases

{ config, pkgs, ... }:

{
  imports = [ ../base.nix ];

  config = {
    home.packages = with pkgs; [
      # database
      sqlite
      mysql57
      #mysql-workbench
      postgresql
      redis
      etcdctl
      vault

      # storage
      s3fs
      minio-client
      gzrt # gzip recovery

      # remote
      rdesktop
      gtk-vnc
      openvpn
      remmina

      # crypto
      mkpasswd
      pwgen
      apacheHttpd # for htpasswd
      xca
      cfssl

      # networking
      ncftp
      curl_unix_socket
      socat
      bmon
      tcptrack
      stunnel
      wireshark
    ];
  };
}
