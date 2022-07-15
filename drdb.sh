# Add Anjuna tools to PATH
echo "export PATH=\$PATH:/opt/anjuna/nitro/bin" >> /home/ec2-user/.bashrc

# Build the DRBD kernel module
sudo chown ec2-user.ne /opt/anjuna/nitro/drbd
cd /opt/anjuna/nitro/drbd
./parent-drbd-setup.sh --build

