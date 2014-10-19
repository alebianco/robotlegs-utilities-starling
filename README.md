# RoboStarlegs

[![Build Status](https://travis-ci.org/alebianco/robotlegs-utilities-starling.svg?branch=master)](https://travis-ci.org/alebianco/robotlegs-utilities-starling)

RoboStarlegs allows you to use [Robotlegs](http://www.robotlegs.org/) with [Starling](http://gamua.com/starling/) and any other library based on that, like [Feathers](http://feathersui.com/), in the same fashion you'd use it with the regular Flash display list or Flex.

## Introduction

This extension provides a bundle of plugins for Robotlegs that are aimed at mimicking the functionalities we all love on a standard Flash/Flex display list when using Starling/Feathers on Stage3D.

Automatic mediator mapping is not something you will want to use extensively on your games, especially if you're focusign on getting the beste possible performances out of it, but it's incredibly useful for kickstarting the game and handle all the UI operations. It also makes it easier to convert your Flex-based rich application into an incredibly fast performancing app thanks to Feathers.

# Releases

You'll find new versions of the extension in the [Releases page](https://github.com/alebianco/robotlegs-utilities-starling/releases) of the repository.

## Usage

From your main class, when you initialize Starling, create a Robotlegs Context and install the StarlingBundle and the ViewProcessMapExtension.
You'll to use the right version of the ContextView to pass your Starling instance to the Robotleg's context so mind those imports!

```ActionScript
	import robotlegs.starling.bundles.mvcs.StarlingBundle;
	import robotlegs.starling.extensions.contextView.ContextView;
	import robotlegs.starling.extensions.viewProcessorMap.ViewProcessorMapExtension;

	...

	private var context:IContext;
	private var starling:Starling;

	...

	starling = new Starling(Game, this.stage);
	starling.start();

	context = new Context()
				  .install(StarlingBundle, ViewProcessorMapExtension)
				  .configure(GameConfig, new ContextView(starling))
```

You can now start mapping all your commands and classes like you would in a normal Robotlegs application.

When it comes to views and mediators, there's an extra step to take if you want them to be mapped automatically.
The ViewProcessorMap needs to be informed . 

In your GameConfig you'll have someting like:

```ActionScript
package {

import you.package.views.BaseScreen;

import robotlegs.bender.extensions.matching.TypeMatcher;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.starling.extensions.viewProcessorMap.api.IViewProcessorMap;

public class GameConfig implements IConfig {

	...

    [Inject]
    public var views:IViewProcessorMap;

    public function configure():void {

    	...
        views.mapMatcher(new TypeMatcher().allOf(BaseScreen)).toInjection();
        ...
    }
}
}
```

Where BaseScreen is an abstract class that all your views are going to extend.

As I said, processing every instance added or remove from the screen could become an expensive process, so you don't want to process more instances then you need: don't go around creating matchers for `starling.display.Sprite` or some other very generic class, unless you want it to have a big impact on your game's performances ...

## Building

In the **gradle** folder, make a copy of the _user.properties.eg_ file and call it _user.properties_
Edit that file to provide values specific to your system  
Use the `gradlew` script to build the project

## Contributing

If you want to contribute to the project refer to the [contributing document](CONTRIBUTING.md) for guidelines.