// 1. إعلانات plugins (إن وجدت)
plugins {
    // ...
}
buildscript {
    val kotlinVersion = "1.7.10" // تعريف مباشر
    extra.apply {
        set("kotlin_version", "1.9.22") // أو أحدث إصدار
    }

    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:${extra["kotlin_version"]}")
        classpath("com.android.tools.build:gradle:7.3.0")
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlinVersion")
    }
}// 3. إعدادات allprojects
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// 4. التعديلات الخاصة بمسارات البناء (الجديدة التي تريد إضافتها)
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newBuildDir)

    // هذه السطر قد يحتاج إلى تعديل حسب هيكل مشروعك
    project.evaluationDependsOn(":app")
}

// 5. مهمة clean المخصصة
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}