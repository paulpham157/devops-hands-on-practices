# Linux and Unix Command Cheat Sheet

## System

```bash
uname -a
cat /etc/os-release
whoami
id
date
env
```

## Files

```bash
pwd
ls -la
cd /path
mkdir -p dir/subdir
touch file
cp source dest
mv source dest
rm file
ln file hard-link
ln -s target symlink
```

## Permissions

```bash
chmod 755 script.sh
chmod +x script.sh
chown user:group file
umask
stat file
```

## Text

```bash
cat file
less file
head file
tail file
grep pattern file
awk '{print $1}' file
sed 's/old/new/g' file
sort file
uniq -c
wc -l file
```

## Processes

```bash
ps
ps aux
top
kill -TERM PID
kill -KILL PID
echo $?
```

## Networking

```bash
hostname
ip addr
ss -tulpen
curl -I http://example.com
```

Some minimal images may not include `ip`, `ss`, `curl`, or `bash`.

