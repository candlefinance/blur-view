import {
  requireNativeComponent,
  UIManager,
  Platform,
  ViewStyle,
} from 'react-native';

const LINKING_ERROR =
  `The package '@candlefinance/blur-view' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

type BlurViewProps = {
  color: string;
  style: ViewStyle;
};

const ComponentName = 'BlurViewView';

export const BlurViewView =
  UIManager.getViewManagerConfig(ComponentName) != null
    ? requireNativeComponent<BlurViewProps>(ComponentName)
    : () => {
        throw new Error(LINKING_ERROR);
      };
