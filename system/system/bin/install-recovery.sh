#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:da5fab31b32ad195388617c0a98114fae4e8b467; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:bdae96dcaaa575a2b69956e37e58e81f76e5ffad \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:da5fab31b32ad195388617c0a98114fae4e8b467 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
