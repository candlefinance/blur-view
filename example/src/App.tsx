import * as React from 'react';

import { ScrollView, Dimensions, Image, StyleSheet } from 'react-native';
import { VariableBlurView } from '@candlefinance/blur-view';
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
      <VariableBlurView maxBlurRadius={10} style={styles.top} />
      <VariableBlurView style={styles.bottom} />
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
