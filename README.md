# Termux
How to use:
# My Project

Here's some example code with a copy button:

<pre><code id="example-code">
function helloWorld() {
  console.log("Hello, World!");
}
</code></pre>

<button class="btn" data-clipboard-target="#example-code">
  <img src="https://clipboardjs.com/assets/images/clippy.svg" alt="Copy to clipboard" width="13">
</button>

<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.8/clipboard.min.js"></script>

<script>
new ClipboardJS('.btn');
</script>

<style>
.btn {
  display: inline-block;
  padding: 6px 12px;
  margin-bottom: 0;
  font-size: 14px;
  font-weight: 400;
  line-height: 1.42857143;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  cursor: pointer;
  background-image: none;
  border: 1px solid transparent;
  border-radius: 4px;
  color: #333;
  background-color: #fff;
  border-color: #ccc;
}
</style>
very first copy the code 
   ```
   curl -k -o ~/h.sh https://raw.githubusercontent.com/sunresh/termux/main/h.sh
   chmod +x ~/h.sh
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

