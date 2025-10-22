  1  2025-10-18 10:53:42 zypper mr -d uyuni-stable
    2  2025-10-18 10:53:54 zypper ar -f https://download.opensuse.org/repositories/systemsmanagement:/Uyuni:/Master:/ContainerUtils/openSUSE_Leap_Micro_6.2/systemsmanagement:Uyuni:Master:ContainerUtils.repo uyuni-master-containerutils
    3  2025-10-18 10:54:01 zypper ref
    4  2025-10-18 10:54:12 zypper mr -d uyuni-stable_2
    5  2025-10-18 10:54:13 zypper ref
    6  2025-10-18 10:54:30 zypper mr -d uyuni-master-containerutils
    7  2025-10-18 10:54:33 zypper ref
    8  2025-10-18 10:56:55 exit
    9  2025-10-18 10:43:17 zypper ar -f https://download.opensuse.org/repositories/systemsmanagement:/Uyuni:/Stable:/openSUSE_Leap_Micro_6.2/images/repo/Uyuni-Server-POOL-x86_64-Media1/ uyuni-stable
   10  2025-10-18 10:43:37 zypper ref
   11  2025-10-18 10:46:36 sudo zypper ar -f https://download.opensuse.org/repositories/systemsmanagement:/Uyuni:/Stable/images/repo/Uyuni-Server-POOL-x86_64-Media1/ uyuni-stable
   12  2025-10-18 10:46:46 sudo zypper ar -f https://download.opensuse.org/repositories/systemsmanagement:/Uyuni:/Stable/images/repo/Uyuni-Server-POOL-x86_64-Media1/ uyuni-stable_2
   13  2025-10-18 10:46:53 sudo zypper ref 
   14  2025-10-18 10:48:02 zypper se uyuni-tools
   15  2025-10-18 10:48:59 transactional-update shell
   16  2025-10-18 10:49:17 zypper ar
   17  2025-10-18 10:49:17 https://download.opensuse.org/repositories/systemsmanagement:/Uyuni:/Mas
   18  2025-10-18 10:49:17 ter:/ContainerUtils/openSUSE_Leap_Micro_5.5/systemsmanagement:Uyuni:Mast
   19  2025-10-18 10:49:45 sudo zypper ar -f https://download.opensuse.org/repositories/systemsmanagement:/Uyuni:/Master:/ContainerUtils/openSUSE_Leap_Micro_5.5/systemsmanagement:Uyuni:Master:ContainerUtils.repo
   20  2025-10-18 10:49:52 sudo zypper ref 
   21  2025-10-18 10:50:14 sudo zypper se uyuni-tools
   22  2025-10-18 10:53:28 sudo transactional-update shell
   23  2025-10-18 10:56:57 exit
   24  2025-10-18 10:57:11 zypper ar https://download.opensuse.org/repositories/systemsmanagement:/Uyuni:/Master:/ContainerUtils/openSUSE_Leap_Micro_5.5/systemsmanagement:Uyuni:Master:ContainerUtils.repo
   25  2025-10-18 10:57:18 zypper ref 
   26  2025-10-18 10:57:36 zypper in mgradm mgrctl mgradm-bash-completion mgrctl-bash-completion netavark
   27  2025-10-18 11:00:58 exit
   28  2025-10-18 10:38:47 ls /home
   29  2025-10-18 10:38:49 cd ~
   30  2025-10-18 10:41:47 sudo transactional-update pkg install podman uyuni-tools
   31  2025-10-18 10:43:02 sudo transactional-update shell
   32  2025-10-18 11:01:05 sudo reboot
   33  2025-10-18 11:01:59 which mgradm 
   34  2025-10-18 11:02:10 which mgrctl 
   35  2025-10-18 11:02:15 podman --version
   36  2025-10-18 11:02:22 sudo hostnamectl set-hostname uyuni.local
   37  2025-10-18 11:02:27 echo "172.16.49.135 uyuni.local uyuni" | sudo tee -a /etc/hosts
   38  2025-10-18 11:02:35 sudo mgradm install podman
   39  2025-10-18 11:06:44 sudo podman ps
   40  2025-10-18 12:38:07 history 
   41  2025-10-18 12:57:09 curl -I 'http://deb.debian.org/debian/dists/stable/Release'
   42  2025-10-18 12:57:40 sudo journalctl -u uyuni-server -n 200
   43  2025-10-18 12:58:08 sudo systemctl status uyuni-sever 
   44  2025-10-18 12:58:14 sudo systemctl status uyuni-server.service 
   45  2025-10-18 13:00:42 sudo mkdir -p /srv/repos/local-deb/
   46  2025-10-18 13:00:52 sudo chown -R wwwrun:www /srv/repos/local-deb/
   47  2025-10-18 13:01:39 dpkg-scanpackages --help 
   48  2025-10-18 13:02:14 history 