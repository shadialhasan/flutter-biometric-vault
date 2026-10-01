# 🛡️ flutter-biometric-vault

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Security: Biometrics](https://img.shields.io/badge/Auth-BiometricPrompt%20%7C%20FaceID-brightgreen.svg)](https://github.com/MobileConduit)
[![CI Pipeline](https://github.com/MobileConduit/flutter-biometric-vault/actions/workflows/ci.yml/badge.svg)](https://github.com/MobileConduit/flutter-biometric-vault/actions)

Biometric hardware-backed secure storage wrapper for Flutter, integrating Android Keystore and iOS Keychain encryption with Face ID / Fingerprint gating.

## 🏗️ Hardware Cryptographic Gating

```mermaid
sequenceDiagram
    autonumber
    actor User
    participant Flutter as Flutter App
    participant Vault as MobileBiometricVault
    participant SecureEnclave as Hardware Secure Enclave / TEE
    
    User->>Flutter: Trigger Protected Action
    Flutter->>Vault: authenticateWithBiometrics(reason)
    Vault->>SecureEnclave: BiometricPrompt / LocalAuthentication
    SecureEnclave-->>User: Fingerprint / FaceID Prompt
    User->>SecureEnclave: Biometric Scan
    SecureEnclave-->>Vault: Crypto Key Release Approved
    Vault->>SecureEnclave: Decrypt AES Master Token
    SecureEnclave-->>Vault: Plaintext Credentials
    Vault-->>Flutter: Authenticated Action Granted
```

## 🚀 Usage

```dart
final vault = MobileBiometricVault();

// Prompt user for fingerprint / face verification
final authenticated = await vault.authenticateWithBiometrics("Authorize Transaction");

if (authenticated) {
  final token = await vault.readSecureToken("session_token");
}
```

---

## 👤 Author & Maintainer

**Eng. MHD. Shadi AL-Hasan**  
- **Role:** Executive CTO & Enterprise Solutions Architect  
- **Email:** [mhd.shadi.alhasan@gmail.com](mailto:mhd.shadi.alhasan@gmail.com)  
- **Phone / WhatsApp:** [+963934005922](tel:+963934005922)  
- **Location:** Damascus, Syria  
- **GitHub:** [MobileConduit](https://github.com/MobileConduit)  

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.  
Copyright (c) 2026 **MHD. Shadi AL-Hasan**. All rights reserved.
