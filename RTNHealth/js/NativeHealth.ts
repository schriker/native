import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  isStepCountingAvailable(callback: (isAvailable: boolean) => void): void,
  hasMotionPermissions(callback: (isAuthorized: boolean) => void): void,
  queryStepsCount(fromDate: string, toDate: string, callback: (stepCount: number | null) => void): void
}

export default TurboModuleRegistry.get<Spec>('RTNHealth');