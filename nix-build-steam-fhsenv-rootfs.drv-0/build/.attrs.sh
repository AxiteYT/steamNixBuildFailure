declare buildCommand='/nix/store/f4zbl6ngbpgqnmzrrhnwqhrkrcyrym9h-fhs-rootfs-bulder/bin/rootfs-builder

# create a bunch of symlinks for usrmerge
ln -s /usr/bin $out/bin
ln -s /usr/sbin $out/sbin
ln -s /usr/lib $out/lib
ln -s /usr/lib32 $out/lib32
ln -s /usr/lib64 $out/lib64
ln -s /usr/lib64 $out/usr/lib

# symlink 32-bit ld-linux so it'\''s visible in /lib
if [ -e $out/usr/lib32/ld-linux.so.2 ]; then
  ln -s /usr/lib32/ld-linux.so.2 $out/usr/lib64/ld-linux.so.2
fi

# symlink /etc/mtab -> /proc/mounts (compat for old userspace progs)
ln -s /proc/mounts $out/etc/mtab

if [[ -d $out/usr/share/gsettings-schemas/ ]]; then
  for d in $out/usr/share/gsettings-schemas/*; do
    # Force symlink, in case there are duplicates
    ln -fsr $d/glib-2.0/schemas/*.xml $out/usr/share/glib-2.0/schemas
    ln -fsr $d/glib-2.0/schemas/*.gschema.override $out/usr/share/glib-2.0/schemas
  done
  /nix/store/pq7p4bqr2wimdp1qp01q10gbvasd55hk-glib-2.82.1-dev/bin/glib-compile-schemas $out/usr/share/glib-2.0/schemas
fi



'
declare -a buildInputs=()
declare builder='/nix/store/0irlcqx2n3qm6b1pc9rsd2i8qpvcccaj-bash-5.2p37/bin/bash'
declare -a cmakeFlags=()
declare -a configureFlags=()
declare -a depsBuildBuild=()
declare -a depsBuildBuildPropagated=()
declare -a depsBuildTarget=()
declare -a depsBuildTargetPropagated=()
declare -a depsHostHost=()
declare -a depsHostHostPropagated=()
declare -a depsTargetTarget=()
declare -a depsTargetTargetPropagated=()
declare doCheck=
declare doInstallCheck=
declare enableParallelBuilding=1
declare enableParallelChecking=1
declare enableParallelInstalling=1
declare -A env=()
declare includeClosures=1
declare isMultiBuild=1
declare -a mesonFlags=()
declare name='steam-fhsenv-rootfs'
declare -a nativeBuildInputs=('/nix/store/f5y04jklz034w0y55bnqhcfnd271spwa-jq-1.7.1-dev' )
declare -A outputs=(['out']='/nix/store/bk0qhfpq1lwkc60cqqj48rdr3x4byf3y-steam-fhsenv-rootfs' )
declare -a passAsFile=('buildCommand' )
declare -a patches=()
declare -a propagatedBuildInputs=()
declare -a propagatedNativeBuildInputs=()
declare stdenv='/nix/store/z50gnrdklgq4sfq59z2sw80mbnr9nrk3-stdenv-linux'
declare strictDeps=
declare system='x86_64-linux'
