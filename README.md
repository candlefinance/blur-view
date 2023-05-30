[![npm version](https://badge.fury.io/js/%40candlefinance%2Fblur-view.svg)](https://badge.fury.io/js/%40candlefinance%2Fblur-view)[![npm downloads](https://img.shields.io/npm/dm/%40candlefinance%2Fblur-view.svg)](https://npm.im/%40candlefinance%2Fblur-view)

# VariableBlurView for React Native (iOS only)

Variable Blur View for React Native. Inspired by [@jtrivedi](https://github.com/jtrivedi) and [@aheze](https://github.com/aheze/VariableBlurView).

## Preview

[![Watch the video](https://github.com/candlefinance/dino/assets/12258850/13604ce8-2295-46ac-b1fd-411940d99b53)](https://github.com/candlefinance/blur-view/assets/12258850/2956ae3c-41d7-42b7-829f-abeded2c570c)

## Installation

```sh
yarn add @candlefinance/blur-view
```

## Usage

Use the `BlurViewView` component to blur the content behind it.

```js
import { BlurViewView } from '@candlefinance/blur-view';

<BlurViewView
  style={{
    width,
    height: 200,
    position: 'absolute',
  }}
/>;
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
