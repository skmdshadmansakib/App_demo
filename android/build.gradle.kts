buildscript {
    repositories {
        google()
        mavenCentral()  // Ensure mavenCentral is included here
    }
    dependencies {
        // Specify the Kotlin Gradle plugin version directly
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.8.22") // Update with the latest stable version
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()  // Ensure mavenCentral is included for all projects
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
