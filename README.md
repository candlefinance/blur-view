[![npm version](https://badge.fury.io/js/%40candlefinance%2Fblur-view.svg)](https://badge.fury.io/js/%40candlefinance%2Fblur-view)[![npm downloads](https://img.shields.io/npm/dm/%40candlefinance%2Fblur-view.svg)](https://npm.im/%40candlefinance%2Fblur-view)

# VariableBlurView for React Native (iOS only)

Variable Blur View for React Native. Inspired by [@jtrivedi](https://github.com/jtrivedi) and [@aheze](https://github.com/aheze/VariableBlurView).

## Preview

https://github.com/candlefinance/blur-view/assets/12258850/53f5a05f-7594-4f7e-acbc-997b10ee4345

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
