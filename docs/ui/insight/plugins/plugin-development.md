---
title: "Develop RedisInsight plugins"
linkTitle: Develop plugins
description: Guidance on developing RedisInsight plugins
weight: 30
aliases:
---

To encapsulate plugin scripts and styles, plugin visualization in **Workbench** is rendered using IFrame, as described in 
the main plugin script and the stylesheet (if it is specified in the `package.json`).
IFrame also includes basic styles.

## Plugin structure

Each plugin should have a unique name with all its files loaded to a separate folder inside the default `plugins` folder. For more information, see [Install RedisInsight plugins](/docs/ui/insight/plugins/plugin-installation).

{{% alert title="Note" color="warning" %}}
 
Default plugins are located inside the application.

{{% /alert %}}

### Files

`package.json` should be located in the root folder of your plugins, all other files can be included into a sub-folder.

* **pluginName/package.json** *(required)*: Manifest of the plugin
* **pluginName/{anyName}.js** *(required)*: Core script of the plugin
* **pluginName/{anyName}.css** *(optional)*: File with styles for the plugin visualizations
* **pluginName/{anyFileOrFolder}** *(optional)*: Specify any other file or folder inside the plugin folder 
to use by the core module script. Example: `pluginName/images/image.png`.

## `package.json` structure

To use the plugin, the `package.json` file should include these required fields:

<table>
  <tr>
    <td><code>name</code></td>
    <td>Plugin name. Use the folder name as the plugin name in the <code>package.json</code>.</td>
  </tr>
  <tr>
    <td><code>main</code></td>
    <td>Relative path to the core script of the plugin. Example: <code>./dist/index.js</code></td>
  </tr>
  <tr>
    <td><code>visualizations</code></td>
    <td>
      Array of visualizations (objects) to visualize the results in the Workbench.
      <br><br>
      Required fields in visualizations:
      <ul>
        <li><code>id</code>: Visualization id</li>
        <li><code>name</code>: Visualization name to display in <b>Workbench</b></li>
        <li><code>activationMethod</code>: Name of the exported function to call when 
this visualization is selected in the Workbench</li>
        <li>
          <code>matchCommands</code>: Array of commands to use the visualization for. Supports regex string. 
          Example: `["CLIENT LIST", "FT.*"]`
        </li>
      </ul>
    </td>
  </tr>
</table>

You can specify the path to a css file in the `styles` field. If specified, 
this file will be included inside the IFrame plugin.

Simple example of the `package.json` file with required and optional fields:

```json
{
  "author": {
    "name": "Redis Ltd.",
    "email": "support@redis.com",
    "url": "https://redis.com/redis-enterprise/redis-insight"
  },
  "description": "Show client list as table",
  "styles": "./dist/styles.css",
  "main": "./dist/index.js",
  "name": "client-list",
  "version": "0.0.1",
  "scripts": {},
  "visualizations": [
    {
      "id": "clients-list",
      "name": "Table",
      "activationMethod": "renderClientsList",
      "matchCommands": [
        "CLIENT LIST"
      ],
      "description": "Example of client list plugin",
      "default": true
    }
  ],
  "devDependencies": {},
  "dependencies": {}
}
```

## Core script of the plugin

The core (required) script contains function and its export (functions, for multiple visualizations). 
The script is run after the relevant visualization is selected in **Workbench**.

The following function receives props of the executed commands:

```typescript
interface Props {
  command: string; // executed command
  data: Result[]; // array of results (one item for Standalone)
}

interface Result {
  response: any; // response of the executed command
  status: 'success' | 'fail'; // response status of the executed command
}

const renderVisualization = (props: Props) => {
    // Do your magic
}

export default { renderVisualization }
```

Each plugin iframe has basic styles of RedisInsight application, including fonts and color schemes.

It is recommended to use the React & [Elastic UI library](https://elastic.github.io/eui/#/) for 
consistency with plugin visualizations and the entire application.

Find the example of the plugin here.

* [Client List Plugin README](https://github.com/RedisInsight/Packages/blob/main/clients-list-example/README.md)
* [Client List Plugin dir](https://github.com/RedisInsight/Packages/blob/main/clients-list-example/)

### Available parameters

Additional information provided to the plugin iframe is included in the `window.state` 
inside of the plugin script.

```javascript
const { config, modules } = window.state
const { baseUrl, appVersion } = config

// modules - the list of modules of the current database
// baseUrl - url for your plugin folder - can be used to include your assets
// appVersion - version of the RedisInsight application
```

### Plugin rendering

To render the plugin visualization, the iframe with basic html is generated which is 
then populated with relevant scripts and styles. To render the html data, use existing 
DOM Element `#app` or create your own DOM Elements.

The rendered iframe also includes `theme_DARK` or `theme_LIGHT` className on `body` to indicate the application theme used.

**JavaScript**

```javascript
const renderVisualization = (props) => {
    const { command, data = [] } = props;
    const [{ result, status }] = data
    document.getElementById('app')
      .innerHTML = `
        <h3>Executed command:<h3>
        <p>${command}</p>
        <h4>Result of the command</h4>
        <p>${result}</p>
        <h4>Status of the command</h4>
        <p>${status}</p>
      `
}

export default { renderVisualization }
```

**React**

```javascript
import { render } from 'react-dom'
import App from './App'

const renderVisualization = (props) => {
  const { command, data = [] } = props
  const [{ result, status }] = data
  render(
    <App command={command} response={result} status={status} />,
    document.getElementById('app')
  )
}

// This is a required action - export the main function for execution of the visualization
export default { renderVisualization }
```

## Plugin communication

Use the [redisinsight-plugin-sdk](https://www.npmjs.com/package/redisinsight-plugin-sdk), which is a third party library, 
to communicate with the main app.

Find the list and description of methods called in the [README.md](https://github.com/RedisInsight/RedisInsight/blob/main/redisinsight/ui/src/packages/clients-list/README.md).
