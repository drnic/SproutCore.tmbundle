# TextMate bundle for SproutCore

## SC.Record

`rec` creates an SC.Record model:

``` javascript
SC.Record.extend({
  example: SC.Record.attr(String, { defaultValue: 'Unspecified', isRequired: YES })
});
```

### SC.Record.attr(...)

There are several snippets to create attributes.

`attr` creates a generic SC.Record.attr(...) as demonstrated above.

`atts`, `attn` and `attd` create String, Number and SC.DateTime specific versions:

``` javascript
SC.Record.attr(String, { defaultValue: 'Unspecified', isRequired: YES }),
SC.Record.attr(Number, { defaultValue: 0, isRequired: YES }),
SC.Record.attr(SC.DateTime, { format: 'YY-mm-dd', isRequired: YES }),
```

## Related bundles

See also the following bundles:

* [Handlebars](https://github.com/drnic/Handlebars.tmbundle)
* [JavaScript](https://github.com/subtleGradient/javascript.tmbundle)
* [JavaScript Tools](https://github.com/subtleGradient/javascript-tools.tmbundle)

## Build Tools support

* Added new command to launch Terminal and run the Development Server (trigger: ⇧⌘R)
* Added new commands to generate Sproutcore stuffs like: app, framework, language, theme, model, view, controller using sc-gen (trigger: ⌥⇧⌘N)

## Installation

To install via Git:

		mkdir -p ~/Library/Application\ Support/TextMate/Bundles
		cd ~/Library/Application\ Support/TextMate/Bundles
		git clone git://github.com/drnic/sproutcore-tmbundle.git "SproutCore.tmbundle"
		osascript -e 'tell app "TextMate" to reload bundles'

Source can be viewed or forked via GitHub: [http://github.com/drnic/sproutcore-tmbundle/tree/master](http://github.com/drnic/sproutcore-tmbundle/tree/master)


