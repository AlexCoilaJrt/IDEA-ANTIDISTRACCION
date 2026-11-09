plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.alexcoila.enfoque"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "com.alexcoila.enfoque"
        // 26: TYPE_APPLICATION_OVERLAY y canales de notificación.
        minSdk = 26
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    // Flavors: `local` es el único que se usa por ahora (sin servicios externos).
    flavorDimensions += "env"
    productFlavors {
        create("local") {
            dimension = "env"
            applicationIdSuffix = ".local"
            manifestPlaceholders["appLabel"] = "Enfoque (local)"
        }
        create("dev") {
            dimension = "env"
            applicationIdSuffix = ".dev"
            manifestPlaceholders["appLabel"] = "Enfoque (dev)"
        }
        create("prod") {
            dimension = "env"
            manifestPlaceholders["appLabel"] = "Enfoque"
        }
    }

    buildTypes {
        release {
            // Sin firma propia todavía: solo uso local.
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    testOptions {
        unitTests.isReturnDefaultValues = true
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

dependencies {
    // Pigeon genera APIs con corrutinas.
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.10.2")
    testImplementation("junit:junit:4.13.2")
}

flutter {
    source = "../.."
}
