import { ViewStyle, requireNativeComponent } from 'react-native';

type BlurViewProps = {
  style: ViewStyle;
  blurTintColor?: string;
  blurRadius: number;
  blurEnabled?: boolean;
  colorTintOpacity?: number;
  scale?: number;
  children?: React.ReactNode;
};

const ComponentName = 'BlurViewView';

export const BlurView = requireNativeComponent<BlurViewProps>(ComponentName);
