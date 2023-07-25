
ssh-keyscan github.com >> /tmp/githubKey
cat /tmp/githubKey > /home/root/.ssh/known_hosts
chmod 644 /home/root/.ssh/known_hosts
chown root /home/root/.ssh/known_hosts
echo "TEST"
