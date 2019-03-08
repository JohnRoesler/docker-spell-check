# docker-spell-check

A docker image that runs aspell and outputs a list of misspelled words

## how it works

The docker container installs [aspell](http://aspell.net/) runs `spell_check.sh` which will spell check files matching the `CHECK_NAME` pattern recursively.

## usage

### docker

Syntax

```bash
docker run -v <path-to-directory-to-spell-check>:<mount-path> \
      -e PERSONAL_WORDS="<path-to-.pws-file-in-mounted-path>" \
      -e CHECK_DIR="<directory-to-spell-check-in-mounted-path>" \
      -e CHECK_NAME="<the-name-pattern-of-files-to-check>" \
      --rm JohnRoesler/docker-spell-check:latest
```

Example spell check on all `.md` files in directory

```bash
foo@bar:~$ docker run -v /Users/me/docs:/docs \
      -e PERSONAL_WORDS="/docs/my_words.pws" \
      -e CHECK_DIR="/docs/interesting_content/" \
      -e CHECK_NAME="*.md" \
      --rm JohnRoesler/docker-spell-check:latest
/docs/interesting_content/hello_world.md
spellng
issss
haaardd
```

### docker-compose

Populate the ENVs in `docker-compose.yaml` and then run

```bash
foo@bar:~$ docker-compose up
Creating docker-spell-check_docker-spell-check_1 ... done
Attaching to docker-spell-check_docker-spell-check_1
docker-spell-check_1  | /docs/interesting_content/hello_world.md
docker-spell-check_1  | spellng
docker-spell-check_1  | issss
docker-spell-check_1  | haaardd
```
