# omarchy

The packages, font, and few config files I've actually changed from Omarchy's defaults on this machine.

## Usage

### Fresh machine:

```
./install.sh
```

Installs `packages/core.txt`, removes `packages/remove.txt` (packages dropped
from the Omarchy defaults), removes/installs the webapps in `webapps/`, sets
the system font, copies `config/` into `~/.config`. Backs up anything it
would overwrite first. Safe to re-run.

Set `INSTALL_REVIEW=yes` to also install `packages/review.txt` (packages
that are installed here but not yet decided on).

### Existing machine, after editing `~/.config` directly:

```
./pull.sh
```

Copies any changed tracked file back into `config/`, then `git diff` in this
repo and commit.

## Files

- `packages/core.txt` - packages installed on top of the Omarchy base set
- `packages/review.txt` - installed but undecided; skipped unless `INSTALL_REVIEW=yes`
- `packages/remove.txt` - Omarchy default packages dropped on this machine
- `webapps/remove.txt` - default Omarchy webapp launchers removed
- `webapps/add.txt` - custom webapp launchers added (`Name|URL`)
- `webapps/mailto-default.txt` - desktop file set as the default mailto: handler
- `config/paths.txt` - the list of tracked config paths, used by both scripts
- `config/` - the tracked files themselves, mirroring their `~/.config` path
