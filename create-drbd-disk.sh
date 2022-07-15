#!/bin/bash
#
# DO NOT RUN THIS SCRIPT ON THE TERRAFORM HOST.  We copy this
# script to the EC2 instance and run it there.
#
set -e
set -x

export PATH="/opt/anjuna/nitro/bin:/opt/anjuna/nitro/drbd:${PATH}"

DISK_SIZE_MB=$((10 * 1024)) # 10 GiB

echo "Creating ${DISK_SIZE_MB}MB disk image, this can take some time"
start_time=$SECONDS
echo $elapsed

# Capture the absolute disk image path before we change directories
DISK_IMAGE=nitro-disk.img

parent-drbd-setup.sh -stop
rm -f "${DISK_IMAGE}"
parent-drbd-setup.sh --size "${DISK_SIZE_MB}" --disk-create "${DISK_IMAGE}"

elapsed_time=$(( SECONDS - start_time ))
echo "Disk image creation complete (${elapsed_time} seconds)"

# start the parent DRDB listener
parent-drbd-setup.sh -start "${DISK_IMAGE}"

