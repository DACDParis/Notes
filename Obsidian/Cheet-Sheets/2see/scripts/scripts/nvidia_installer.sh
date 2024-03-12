dnf config-manager --add-repo=https://negativo17.org/repos/fedora-nvidia.repo
yum -y remove *nvidia*
dnf -y install nvidia-driver dkms-nvidia nvidia-driver-cuda cuda-devel
dnf -y install nvidia-driver-libs.i686

