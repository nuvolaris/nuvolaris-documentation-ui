# Nuvolaris Documentation UI
Official repository containing Nuvolaris' documentation UI.

## Contents
- [Prerequisites](#prerequisites)
- [Clone and Initialize the UI Project](#clone-and-initialize-the-ui-project)
- [Preview the UI](#preview-the-ui)
- [Package for Use with Antora](#package-for-use-with-antora)
- [Copyright and License](#copyright-and-license)

## Prerequisites
To preview and bundle the default UI, you need the following software on your computer:

* git
* Node.js
* Gulp CLI

### git
First, make sure you have git installed.

```sh
$ git --version
```

In case you don't have git installed, just download it onto your machine.

### Node.js
Next, make sure that you have Node.js installed (which also provides npm).

```sh
$ node --version
```

If this command fails with an error, you don't have Node.js installed.
We suggest for this project to use the version specified in `.nvmrc` file, which is 10.

While you can install Node.js from the official packages, we strongly recommend that you use `nvm` to manage your Node.js installation(s).

Once you've installed nvm, open a new terminal and install Node.js 10 using the following command:

```sh
$ nvm install 10
```

You can switch to this version of Node.js at any time using the following command:

```sh
$ nvm use 10
```

To make Node.js 10 the default in new terminals, type:

```sh
$ nvm alias default 10
```

Now that you have Node.js installed, you can proceed with installing the Gulp CLI.

### Gulp CLI
You'll need the Gulp command-line interface (CLI) to run the build.
The Gulp CLI package provides the `gulp` command which, in turn, executes the version of Gulp declared by the project.

You can install the Gulp CLI globally (which resolves to a location in your user directory if you're using nvm) using the following command:

```sh
$ npm install -g gulp-cli
```

Verify the Gulp CLI is installed and on your PATH by running:

```sh
$ gulp --version
```

Now that you have the prerequisites installed, you can fetch and build the UI project.

## Clone and Initialize the UI Project
Clone the default UI project using git:

```sh
 $ git clone https://github.com/nuvolaris/nuvolaris-documentation-ui
```

The example above clones Antora's default UI project.
Stay in this project folder when executing all subsequent commands.

Use npm to install the project's dependencies inside the project.
In your terminal, execute the following command:

```sh
$ npm install
```

This command installs the dependencies listed in `package.json` into the `node_modules` folder inside the project.
This folder does not get included in the UI bundle and should _not_ be committed to the source control repository.

## Preview the UI
The default UI project is configured to preview offline.
The files in the `preview-src` folder provide the sample content that allow you to see the UI in action.
In this folder, you'll primarily find pages written in AsciiDoc.
These pages provide a representative sample and kitchen sink of content from the real site.

To build the UI and preview it in a local web server, run the `preview` command:

```sh
$ gulp preview
```

You'll see a URL listed in the output of this command:

```sh
[12:00:00] Starting server...
[12:00:00] Server started http://localhost:5252
[12:00:00] Running server
```

Navigate to this URL to preview the site locally.

While this command is running, any changes you make to the source files will be instantly reflected in the browser.
This works by monitoring the project for changes, running the `preview:build` task if a change is detected, and sending the updates to the browser.

Press CTRL+C to stop the preview server and end the continuous build.

## Package for Use with Antora

If you need to package the UI so you can use it to generate the documentation site locally, run the following command:

```sh
$ gulp bundle
```

If any errors are reported by lint, you'll need to fix them.

When the command completes successfully, the UI bundle will be available at `build/ui-bundle.zip`.  
You can point Antora at this bundle using the `--ui-bundle-url` command-line option.

If you have the preview running, and you want to bundle without causing the preview to be clobbered, use:

```sh
 $ gulp bundle:pack
```

The UI bundle will again be available at `build/ui-bundle.zip`.

### Source Maps

The build consolidates all the CSS and client-side JavaScript into combined files, `site.css` and `site.js`, respectively, in order to reduce the size of the bundle.
Source maps correlate these combined files with their original sources.

This "`source mapping`" is accomplished by generating additional map files that make this association.
These map files sit adjacent to the combined files in the build folder.
The mapping they provide allows the debugger to present the original source rather than the obfuscated file, an essential tool for debugging.

In preview mode, source maps are enabled automatically, so there's nothing you have to do to make use of them.
If you need to include source maps in the bundle, you can do so by setting the `SOURCEMAPS` environment variable to `true` when you run the bundle command:

```sh
$ SOURCEMAPS=true gulp bundle
```

In this case, the bundle will include the source maps, which can be used for debugging your production site.

## Copyright and License

Copyright (C) 2017-present OpenDevise Inc. and the Antora Project.

Use of this software is granted under the terms of the [Mozilla Public License Version 2.0](https://www.mozilla.org/en-US/MPL/2.0/).
