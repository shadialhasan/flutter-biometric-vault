// Automated tests for MobileBiometricVault
// Author: Eng. MHD. Shadi AL-Hasan <mhd.shadi.alhasan@gmail.com>

import 'package:flutter_biometric_vault/biometric_vault.dart';
import 'package:test/test.dart';

void main() {
  group('MobileBiometricVault Tests', () {
    late BiometricVault vault;

    setUp(() {
      vault = MobileBiometricVault();
    });

    test('authenticateWithBiometrics returns true on success', () async {
      final success = await vault.authenticateWithBiometrics('Verify Identity');
      expect(success, isTrue);
    });

    test('readSecureToken returns token payload', () async {
      await vault.writeSecureToken('api_key', 'secret_enterprise_token');
      final val = await vault.readSecureToken('api_key');
      expect(val, isNotNull);
    });

    test('wipeVault executes cleanly', () async {
      await expectLater(vault.wipeVault(), completes);
    });
  });
}
