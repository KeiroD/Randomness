# Randomness
Random stuff of scripts and so on and so forth

## LPM

LPM is now updated to correctly pull status of the `lid` to work on Linux Mint

Should output the following when executed:

```
keiro@Keiro-MOC: cat /proc/acpi/button/lid/LID0/state | awk '{print $2}'
**open**
```
