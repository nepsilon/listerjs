# [Lister.js](http://github.com/nepsilon/listerjs)

A simple list formatter for `textarea` fields.

## Features

> In a nutshell it makes lists behave like in a word processor

* Auto format new lines with the previous line bullet style
* Auto increment numeric list
* Remove bullet when nothing was written on the line
* Zero dependencies &ndash; not even jQuery/Zepto
* Insignificant size: only 67 lines of JavaScript, barely 0.5k minified and gzipped.
* Works on Firefox, Chrome, Safari
* Source available in CoffeeScript

## Getting Started

Place it in your HTML page as such:

```html
<script src='lister.min.js'></script>

<textarea id='my_textarea_id'></textarea>

<script>
  var msg = document.getElementById('my_textarea_id');
  new Lister(msg)
</script>
```

## TODO

* For the moment it only detect lists starting with the characters * and -, this should be configurable when instanciating `Lister`. Something like this: `new Lister(textarea_el, "*-o")`, where the second argument is a string containing all the characters to be recognized as a bullet.
* Numeric lists should work when a dot, a closing parenthesis or any single character is appened right after the number. Example: `1.`, `1)`, etc.
* Numeric lists should work with non arabic numbers (Chinese, Korean, etc).
* Numeric lists should re-order themselves when the user insert a new element above the current element. For instance, when having 5 elements, we put the cursor at the end of the line 2, press return, a new element is correctly inserted and numbered 3, but the elements below now have an incorrect bullet number.
* Need to check IE compatibility. At the moment it will obviously break when binding the event.
