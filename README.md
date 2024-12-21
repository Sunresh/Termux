# Termux
[Click here for web](https://www.github.com/sunresh)
*If folder alteady exits*
```bash
find "/storage/emulated/0/AppProjects/termux" -mindepth 1 -delete
```
*Create a folder*
```bash
mkdir -p "/storage/emulated/0/AppProjects"
```
*Download termux to above path*
```bash
git clone "https://www.github.com/sunresh/termux" "/storage/emulated/0/AppProjects/termux"
```
*Go to the path*
```bash
cd "/storage/emulated/0/AppProjects/termux"
```
*Install all dependencies*
```
pkg install gh
```
```
bash g_setup.sh
```
*If you want to choose branch: eg. v2* 
```bash
git checkout v2
```
*Test app:*
```bash
source "app.sh"
```
```bash
mv "/storage/emulated/0/AppProjects/termux/.bashrc" "$HOME/.bashrc"
```

use fish for better suggestions

very first copy the code 

   ```
   curl -k -o ~/h.sh https://raw.githubusercontent.com/sunresh/termux/main/h.sh && chmod +x ~/h.sh
   ```

simple method

1. Open your Termux configuration file:

   ```
   nano ~/.bashrc
   ```

2. Add the following line at the end of the file:

   ```
   alias sunresh='./h.sh'
   ```

3. Save and exit the file (in nano, press Ctrl+X, then Y, then Enter).

4. Reload your configuration:

   ```
   source ~/.bashrc
   ```

Now you can use the command "sunresh" from anywhere in Termux, and it will run "./h.sh".

This method assumes:
- Your "h.sh" script is in your home directory.
- You want to run it from your home directory.

If you need to run it from a specific location, you can modify the alias to include the full path, like this:

```
alias sunresh='~/path/to/your/h.sh'
```

This simple method creates an alias, which is a shortcut command that runs your script. It's easy to set up and use.

this is from 