import * as React from 'react';

import { BlurView } from '@candlefinance/blur-view';
import { Dimensions, Image, ScrollView, StyleSheet } from 'react-native';
// @ts-ignore
import MyImage from '../images/deepmind.jpg';
// @ts-ignore
import MyImage2 from '../images/deepmind2.jpg';

export default function App() {
  return (
    <>
      <ScrollView pagingEnabled>
        <Image source={MyImage} style={styles.image} />
        <Image source={MyImage2} style={styles.image} />
      </ScrollView>
      <BlurView
        colorTintOpacity={0.5}
        blurTintColor="#ff0067"
        blurRadius={20}
        style={styles.top}
      />
      <BlurView blurRadius={10} style={styles.bottom} />
    </>
  );
}

const styles = StyleSheet.create({
  image: {
    width: Dimensions.get('window').width,
    height: Dimensions.get('window').height,
  },
  top: {
    width: Dimensions.get('window').width,
    height: Dimensions.get('window').height * 0.2,
    position: 'absolute',
  },
  bottom: {
    width: Dimensions.get('window').width,
    height: Dimensions.get('window').height * 0.2,
    position: 'absolute',
    bottom: 0,
    transform: [{ rotate: '180deg' }],
  },
});
