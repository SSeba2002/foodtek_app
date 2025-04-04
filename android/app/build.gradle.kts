plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.foodtek_project"
    compileSdk = 34 // أو flutter.compileSdkVersion إذا عرفته في local.properties

    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.foodtek_project"
        minSdk = 21 // أو flutter.minSdkVersion
        targetSdk = 34 // أو flutter.targetSdkVersion
        versionCode = 1 // أو flutter.versionCode
        versionName = "1.0.0" // أو flutter.versionName
    }

    buildTypes {
        release {
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
        debug {
            isDebuggable = true
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("org.jetbrains.kotlin:kotlin-stdlib:1.9.22")
}