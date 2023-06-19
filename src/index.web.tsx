import * as React from 'react'
import { View } from 'react-native'
import type * as native from './index'

type Props = ComponentProps<typeof native['BlurView']>

// reanimated doesn't support function components
export class BlurView extends React.Component<Props> {
  render() {
    const { style, blurRadius, blurEnabled = true, blurTintColor, scale, colorTintOpacity, ...props } = this.props
    // TODO test a good algorithm for standardizing blur() radius
    // TODO can blurTintColor get implemented on Web?
    // TODO can colorTintOpacity get implemented on Web?
    // TODO can scale get implemented on Web? How would it work?
    // Lastly: if we want reanimated support for the blurRadius, I wonder if it'd work out of the box, or if we need a reanimated implementation in here.
    return <View style={[style, blurEnabled && { filter: `blur(${blurRadius}px)` }]} {...props} />
  }
}
