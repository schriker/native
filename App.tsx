import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View, Alert } from 'react-native';
import { Health } from './RTNHealth';

export default function App() {
  const sevenDaysAgo = new Date(Date.now() - 7 * 24 * 60 * 60 * 1000) 

  return (
    <View style={styles.container}>
      <Text 
        onPress={() => Health.queryStepsCount(sevenDaysAgo.toISOString(), new Date().toISOString(), value => Alert.alert('Steps from last 7 days', `${value}`))}
      >
        Get todays steps count.
      </Text>
      <Text onPress={() => Health.hasMotionPermissions(value => Alert.alert('Permissions granted?', `${value}`))}>Check if permissions granted.</Text>
      <Text onPress={() => Health.isStepCountingAvailable(value => Alert.alert('Step counting supported?', `${value}`))}>Check if step counting is supported.</Text>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
