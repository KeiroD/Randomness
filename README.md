# Randomness
Random stuff of scripts and so on and so forth

## LPM

LPM is now updated to correctly pull status of the `lid` to work on Linux Mint

Should output the following when executed:


`keiro@Keiro-MOC: cat /proc/acpi/button/lid/LID0/state | awk '{print $2}'`

**open**

`Open` is the status you want to get when the laptop's lid is open. And... `closed` when it's actually closed.

### Updating LPM to pull your OS's lid status

Check `/proc/acpi/button/lid/` with `ls -lah` or just `ls -l` to get a listing of your `lid`. Or... just `ls -l /proc/acpi/button/lid` with laziness! You should get something similar to `LID0` for Linux Mint, or some variant of `LID` for other OSes.
