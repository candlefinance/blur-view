[![npm version](https://badge.fury.io/js/%40candlefinance%2Fblur-view.svg)](https://badge.fury.io/js/%40candlefinance%2Fblur-view)[![npm downloads](https://img.shields.io/npm/dm/%40candlefinance%2Fblur-view.svg)](https://npm.im/%40candlefinance%2Fblur-view)

# BlurView for React Native (iOS only)

BlurView for React Native. Supports variable intensity and tint color via [UIVisualEffectView](https://developer.apple.com/documentation/uikit/uivisualeffectview).

## Preview

https://github.com/candlefinance/blur-view/assets/12258850/66fc73aa-7160-41b2-97cd-a406440e372e

## Installation

```sh
yarn add @candlefinance/blur-view
```

## Usage

Use the `BlurView` component to blur the content behind it.

```js
import { BlurView } from '@candlefinance/blur-view';

<BlurView
  blurTintColor="#ff006780" // has to be hex with opacity
  colorTintOpacity={0.2}
  blurRadius={10}
  style={styles.top}
/>;
```

To use with [react-native-reanimated](https://github.com/software-mansion/react-native-reanimated), wrap the BlurView in a `Animated.createAnimatedComponent`.

```js
import { BlurView } from '@candlefinance/blur-view';
const AnimatedBlur = Animated.createAnimatedComponent(BlurView);

const animatedProps = useAnimatedProps(() => {
  const blurRadius = interpolate(
    scrollY.value,
    input,
    output,
    Extrapolate.CLAMP
  );

  return {
    blurRadius,
  };
});

<AnimatedBlur animatedProps={animatedProps} />;
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
