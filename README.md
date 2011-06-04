# TextMate bundle for SproutCore

## Theme

Select the `JavaScript (SproutCore)` grammar and your code will look nice:

<img src="https://img.skitch.com/20110604-pcrxbq1cb3pxtthpfwbga76sch.png">

<caption>Sunbusrt theme</caption>

## Completions

Lots and lots of common SproutCore functions and classes/types are added to the Completion list.
Press Escape to rotate through them. For example, type `SC` and press Escape over and over to
see list of common classes/types.

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
SC.Record.attr(String, { defaultValue: 'Unspecified', isRequired: YES }), // atts
SC.Record.attr(Number, { defaultValue: 0, isRequired: YES }),             // attn
SC.Record.attr(SC.DateTime, { format: 'YY-mm-dd', isRequired: YES }),     // attd
```

### toOne and toMany associations

`SC.Record` can have `toOne` and `toMany` associations, and the snippets are `one` and `many`
respectively:

``` javascript
SC.Record.toOne('App.TargetClass', { isMaster: YES, inverse: 'inverse' })  // one
SC.Record.toMany('App.TargetClass', { isMaster: YES, inverse: 'inverse' }) // many
```

When the cursor/tab stop is over the `Y`, if you type `N` then the snippet changes to a 
non-master association:

``` javascript
SC.Record.toOne('App.TargetClass', { isMaster: NO })  // one, TAB, N
```

### Properties

`prop` creates a property function for an `SC.Record`. The basic snippet provides:

``` javascript
propertyName: function() {
  
}.property('@each.propertyName', 'secondary').cacheable()
```

Various parts are quickly deletable (`@each`, `'secondary'`, `cacheable()`).


## SC.ArrayController

`arrc` generates an `SC.ArrayController` instance:

``` javascript
SC.ArrayController.create({
  // Initialize the array controller with an empty array.
  content: []
});
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

