[![npm version](https://badge.fury.io/js/%40candlefinance%2Fblur-view.svg)](https://badge.fury.io/js/%40candlefinance%2Fblur-view)[![npm downloads](https://img.shields.io/npm/dm/%40candlefinance%2Fblur-view.svg)](https://npm.im/%40candlefinance%2Fblur-view)

# BlurView for React Native (iOS only)

BlurView for React Native (iOS only). Supports variable intensity and tint color via [UIVisualEffectView](https://developer.apple.com/documentation/uikit/uivisualeffectview)

## Preview

https://github.com/candlefinance/blur-view/assets/12258850/53f5a05f-7594-4f7e-acbc-997b10ee4345

## Installation

```sh
yarn add @candlefinance/blur-view
```

## Usage

Use the `BlurView` component to blur the content behind it.

```js
import { BlurView } from '@candlefinance/blur-view';

<BlurView
  blurTintColor="#ff0067"
  colorTintOpacity={0.2}
  blurRadius={10}
  style={styles.top}
/>;
```

## Docs

View the example app in the [example](./example/src/App.tsx) folder.

| Property           | Type     | Default   | Description                              |
| ------------------ | -------- | --------- | ---------------------------------------- |
| `blurRadius`       | `number` | 0         | The amount of blur to apply to the view. |
| `blurTintColor`    | `string` | undefined | Apply a tint color to the blur           |
| `blurEnabled`      | `bool`   | undefined | Hide blur                                |
| `colorTintOpacity` | `number` | undefined | Opacity of the color                     |
| `scale`            | `number` | undefined | scale factor of blur                     |

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
