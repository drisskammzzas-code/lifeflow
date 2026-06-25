import os
import shutil

def create_project():
    print("[LifeFlow] Starting project configuration...")
    
    # 1. Directory Structure
    os.makedirs("LifeFlow.xcodeproj", exist_ok=True)
    os.makedirs("LifeFlow.xcodeproj/project.xcworkspace", exist_ok=True)
    os.makedirs("LifeFlow/Assets.xcassets/AppIcon.appiconset", exist_ok=True)
    
    # 2. Copy the Butterfly Icon
    src_icon = "C:\\Users\\Driss\\.gemini\\antigravity\\brain\\43adf737-f06b-46fc-b376-f7042c425626\\butterfly_app_icon_1782423240129.png"
    dest_icon = "LifeFlow/Assets.xcassets/AppIcon.appiconset/appicon-1024.png"
    
    if os.path.exists(src_icon):
        shutil.copy(src_icon, dest_icon)
        print("[LifeFlow] Butterfly app icon configured successfully.")
    else:
        # Fallback if the icon is not in the system cache
        print("[LifeFlow] Warning: Butterfly app icon source not found. Using default fallback icon.")
        # Try to find a png in the folder
        for file in os.listdir("."):
            if file.startswith("icon-") and file.endswith(".png"):
                shutil.copy(file, dest_icon)
                break
                
    # 3. Create Assets Contents.json for Xcode 14+ Single App Icon
    contents_json = """{
  "images" : [
    {
      "filename" : "appicon-1024.png",
      "idiom" : "universal",
      "platform" : "ios",
      "size" : "1024x1024"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}"""
    with open("LifeFlow/Assets.xcassets/AppIcon.appiconset/Contents.json", "w", encoding="utf-8") as f:
        f.write(contents_json)
        
    # 4. Create Workspace Workspace Data
    workspace_data = """<?xml version="1.0" encoding="UTF-8"?>
<Workspace
   version = "1.0">
   <FileRef
      location = "self:">
   </FileRef>
</Workspace>"""
    with open("LifeFlow.xcodeproj/project.xcworkspace/contents.xcworkspacedata", "w", encoding="utf-8") as f:
        f.write(workspace_data)
        
    # 5. Create project.pbxproj
    # This maps all Swift files, configurations, and frameworks (SwiftData, UserNotifications)
    pbxproj_content = """// !$*UTF8*$!
{
	archiveVersion = 1;
	classes = {
	};
	objectVersion = 56;
	objects = {

/* Begin PBXBuildFile section */
		B1A2F5012C12D3A100912345 /* DayOfWeek.swift in Sources */ = {isa = PBXBuildFile; fileRef = B1A2F5112C12D3A100912345 /* DayOfWeek.swift */; };
		B1A2F5022C12D3A100912346 /* Category.swift in Sources */ = {isa = PBXBuildFile; fileRef = B1A2F5122C12D3A100912346 /* Category.swift */; };
		B1A2F5032C12D3A100912347 /* ActivityTemplate.swift in Sources */ = {isa = PBXBuildFile; fileRef = B1A2F5132C12D3A100912347 /* ActivityTemplate.swift */; };
		B1A2F5042C12D3A100912348 /* ActivityLog.swift in Sources */ = {isa = PBXBuildFile; fileRef = B1A2F5142C12D3A100912348 /* ActivityLog.swift */; };
		B1A2F5052C12D3A100912349 /* ChatMessage.swift in Sources */ = {isa = PBXBuildFile; fileRef = B1A2F5152C12D3A100912349 /* ChatMessage.swift */; };
		B1A2F5062C12D3A10091234A /* NotificationManager.swift in Sources */ = {isa = PBXBuildFile; fileRef = B1A2F5162C12D3A10091234A /* NotificationManager.swift */; };
		B1A2F5072C12D3A10091234B /* AssistantService.swift in Sources */ = {isa = PBXBuildFile; fileRef = B1A2F5172C12D3A10091234B /* AssistantService.swift */; };
		B1A2F5082C12D3A10091234C /* Theme.swift in Sources */ = {isa = PBXBuildFile; fileRef = B1A2F5182C12D3A10091234C /* Theme.swift */; };
		B1A2F5092C12D3A10091234D /* Localization.swift in Sources */ = {isa = PBXBuildFile; fileRef = B1A2F5192C12D3A10091234D /* Localization.swift */; };
		B1A2F50A2C12D3A10091234E /* ConfettiView.swift in Sources */ = {isa = PBXBuildFile; fileRef = B1A2F51A2C12D3A10091234E /* ConfettiView.swift */; };
		B1A2F50B2C12D3A10091234F /* MainTabView.swift in Sources */ = {isa = PBXBuildFile; fileRef = B1A2F51B2C12D3A10091234F /* MainTabView.swift */; };
		B1A2F50C2C12D3A100912350 /* HomeView.swift in Sources */ = {isa = PBXBuildFile; fileRef = B1A2F51C2C12D3A100912350 /* HomeView.swift */; };
		B1A2F50D2C12D3A100912351 /* PlanningView.swift in Sources */ = {isa = PBXBuildFile; fileRef = B1A2F51D2C12D3A100912351 /* PlanningView.swift */; };
		B1A2F50E2C12D3A100912352 /* AddEditActivityView.swift in Sources */ = {isa = PBXBuildFile; fileRef = B1A2F51E2C12D3A100912352 /* AddEditActivityView.swift */; };
		B1A2F50F2C12D3A100912353 /* ProgressView.swift in Sources */ = {isa = PBXBuildFile; fileRef = B1A2F51F2C12D3A100912353 /* ProgressView.swift */; };
		B1A2F5202C12D3A100912354 /* AssistantView.swift in Sources */ = {isa = PBXBuildFile; fileRef = B1A2F5212C12D3A100912354 /* AssistantView.swift */; };
		B1A2F5222C12D3A100912355 /* ProfileView.swift in Sources */ = {isa = PBXBuildFile; fileRef = B1A2F5232C12D3A100912355 /* ProfileView.swift */; };
		B1A2F5242C12D3A100912356 /* SettingsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = B1A2F5252C12D3A100912356 /* SettingsView.swift */; };
		B1A2F5262C12D3A100912357 /* LifeFlowApp.swift in Sources */ = {isa = PBXBuildFile; fileRef = B1A2F5272C12D3A100912357 /* LifeFlowApp.swift */; };
		B1A2F5282C12D3A100912358 /* Assets.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = B1A2F5292C12D3A100912358 /* Assets.xcassets */; };
/* End PBXBuildFile section */

/* Begin PBXFileReference section */
		B1A2F5112C12D3A100912345 /* DayOfWeek.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = DayOfWeek.swift; sourceTree = "<group>"; };
		B1A2F5122C12D3A100912346 /* Category.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = Category.swift; sourceTree = "<group>"; };
		B1A2F5132C12D3A100912347 /* ActivityTemplate.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = ActivityTemplate.swift; sourceTree = "<group>"; };
		B1A2F5142C12D3A100912348 /* ActivityLog.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = ActivityLog.swift; sourceTree = "<group>"; };
		B1A2F5152C12D3A100912349 /* ChatMessage.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = ChatMessage.swift; sourceTree = "<group>"; };
		B1A2F5162C12D3A10091234A /* NotificationManager.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = NotificationManager.swift; sourceTree = "<group>"; };
		B1A2F5172C12D3A10091234B /* AssistantService.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = AssistantService.swift; sourceTree = "<group>"; };
		B1A2F5182C12D3A10091234C /* Theme.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = Theme.swift; sourceTree = "<group>"; };
		B1A2F5192C12D3A10091234D /* Localization.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = Localization.swift; sourceTree = "<group>"; };
		B1A2F51A2C12D3A10091234E /* ConfettiView.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = ConfettiView.swift; sourceTree = "<group>"; };
		B1A2F51B2C12D3A10091234F /* MainTabView.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = MainTabView.swift; sourceTree = "<group>"; };
		B1A2F51C2C12D3A100912350 /* HomeView.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = HomeView.swift; sourceTree = "<group>"; };
		B1A2F51D2C12D3A100912351 /* PlanningView.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = PlanningView.swift; sourceTree = "<group>"; };
		B1A2F51E2C12D3A100912352 /* AddEditActivityView.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = AddEditActivityView.swift; sourceTree = "<group>"; };
		B1A2F51F2C12D3A100912353 /* ProgressView.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = ProgressView.swift; sourceTree = "<group>"; };
		B1A2F5212C12D3A100912354 /* AssistantView.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = AssistantView.swift; sourceTree = "<group>"; };
		B1A2F5232C12D3A100912355 /* ProfileView.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = ProfileView.swift; sourceTree = "<group>"; };
		B1A2F5252C12D3A100912356 /* SettingsView.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = SettingsView.swift; sourceTree = "<group>"; };
		B1A2F5272C12D3A100912357 /* LifeFlowApp.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; path = LifeFlowApp.swift; sourceTree = "<group>"; };
		B1A2F5292C12D3A100912358 /* Assets.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = Assets.xcassets; sourceTree = "<group>"; };
		B1A2F52A2C12D3A100912359 /* LifeFlow.app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = LifeFlow.app; sourceTree = BUILT_PRODUCTS_DIR; };
/* End PBXFileReference section */

/* Begin PBXGroup section */
		B1A2F5002C12D3A100912344 = {
			isa = PBXGroup;
			children = (
				B1A2F5102C12D3A100912344 /* LifeFlow */,
				B1A2F52A2C12D3A100912359 /* LifeFlow.app */,
			);
			sourceTree = "<group>";
		};
		B1A2F5102C12D3A100912344 /* LifeFlow */ = {
			isa = PBXGroup;
			children = (
				B1A2F5272C12D3A100912357 /* LifeFlowApp.swift */,
				B1A2F52F2C12D3A100912360 /* Models */,
				B1A2F5302C12D3A100912361 /* Services */,
				B1A2F5312C12D3A100912362 /* Theme */,
				B1A2F5322C12D3A100912363 /* Views */,
				B1A2F5292C12D3A100912358 /* Assets.xcassets */,
			);
			path = LifeFlow;
			sourceTree = "<group>";
		};
		B1A2F52F2C12D3A100912360 /* Models */ = {
			isa = PBXGroup;
			children = (
				B1A2F5112C12D3A100912345 /* DayOfWeek.swift */,
				B1A2F5122C12D3A100912346 /* Category.swift */,
				B1A2F5132C12D3A100912347 /* ActivityTemplate.swift */,
				B1A2F5142C12D3A100912348 /* ActivityLog.swift */,
				B1A2F5152C12D3A100912349 /* ChatMessage.swift */,
			);
			path = Models;
			sourceTree = "<group>";
		};
		B1A2F5302C12D3A100912361 /* Services */ = {
			isa = PBXGroup;
			children = (
				B1A2F5162C12D3A10091234A /* NotificationManager.swift */,
				B1A2F5172C12D3A10091234B /* AssistantService.swift */,
			);
			path = Services;
			sourceTree = "<group>";
		};
		B1A2F5312C12D3A100912362 /* Theme */ = {
			isa = PBXGroup;
			children = (
				B1A2F5182C12D3A10091234C /* Theme.swift */,
				B1A2F5192C12D3A10091234D /* Localization.swift */,
				B1A2F51A2C12D3A10091234E /* ConfettiView.swift */,
			);
			path = Theme;
			sourceTree = "<group>";
		};
		B1A2F5322C12D3A100912363 /* Views */ = {
			isa = PBXGroup;
			children = (
				B1A2F51B2C12D3A10091234F /* MainTabView.swift */,
				B1A2F51C2C12D3A100912350 /* HomeView.swift */,
				B1A2F51D2C12D3A100912351 /* PlanningView.swift */,
				B1A2F51E2C12D3A100912352 /* AddEditActivityView.swift */,
				B1A2F51F2C12D3A100912353 /* ProgressView.swift */,
				B1A2F5212C12D3A100912354 /* AssistantView.swift */,
				B1A2F5232C12D3A100912355 /* ProfileView.swift */,
				B1A2F5252C12D3A100912356 /* SettingsView.swift */,
			);
			path = Views;
			sourceTree = "<group>";
		};
/* End PBXGroup section */

/* Begin PBXNativeTarget section */
		B1A2F52C2C12D3A10091235A /* LifeFlow */ = {
			isa = PBXNativeTarget;
			buildConfigurationList = B1A2F52D2C12D3A10091235B /* Build configuration list for PBXNativeTarget "LifeFlow" */;
			buildPhases = (
				B1A2F52E2C12D3A10091235C /* Sources */,
				B1A2F5332C12D3A100912365 /* Frameworks */,
				B1A2F5342C12D3A100912366 /* Resources */,
			);
			buildRules = (
			);
			dependencies = (
			);
			name = LifeFlow;
			productName = LifeFlow;
			productReference = B1A2F52A2C12D3A100912359 /* LifeFlow.app */;
			productType = "com.apple.product-type.application";
		};
/* End PBXNativeTarget section */

/* Begin PBXProject section */
		B1A2F5352C12D3A100912367 /* Project object */ = {
			isa = PBXProject;
			attributes = {
				BuildIndependentTargetsInParallel = 1;
				LastSwiftUpdateCheck = 1500;
				LastUpgradeCheck = 1500;
				TargetAttributes = {
					B1A2F52C2C12D3A10091235A /* LifeFlow */ = {
						CreatedOnToolsVersion = 15.0;
						LastSwiftMigration = 1500;
					};
				};
			};
			buildConfigurationList = B1A2F5362C12D3A100912368 /* Build configuration list for PBXProject "LifeFlow" */;
			compatibilityVersion = "Xcode 14.0";
			developmentRegion = fr;
			hasScannedForEncodings = 0;
			knownRegions = (
				fr,
				Base,
			);
			mainGroup = B1A2F5002C12D3A100912344;
			productRefGroup = B1A2F5002C12D3A100912344;
			projectDirPath = "";
			projectRoot = "";
			targets = (
				B1A2F52C2C12D3A10091235A /* LifeFlow */,
			);
		};
/* End PBXProject section */

/* Begin PBXResourcesBuildPhase section */
		B1A2F5342C12D3A100912366 /* Resources */ = {
			isa = PBXResourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				B1A2F5282C12D3A100912358 /* Assets.xcassets in Resources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXResourcesBuildPhase section */

/* Begin PBXSourcesBuildPhase section */
		B1A2F52E2C12D3A10091235C /* Sources */ = {
			isa = PBXSourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				B1A2F5012C12D3A100912345 /* DayOfWeek.swift in Sources */,
				B1A2F5022C12D3A100912346 /* Category.swift in Sources */,
				B1A2F5032C12D3A100912347 /* ActivityTemplate.swift in Sources */,
				B1A2F5042C12D3A100912348 /* ActivityLog.swift in Sources */,
				B1A2F5052C12D3A100912349 /* ChatMessage.swift in Sources */,
				B1A2F5062C12D3A10091234A /* NotificationManager.swift in Sources */,
				B1A2F5072C12D3A10091234B /* AssistantService.swift in Sources */,
				B1A2F5082C12D3A10091234C /* Theme.swift in Sources */,
				B1A2F5092C12D3A10091234D /* Localization.swift in Sources */,
				B1A2F50A2C12D3A10091234E /* ConfettiView.swift in Sources */,
				B1A2F50B2C12D3A10091234F /* MainTabView.swift in Sources */,
				B1A2F50C2C12D3A100912350 /* HomeView.swift in Sources */,
				B1A2F50D2C12D3A100912351 /* PlanningView.swift in Sources */,
				B1A2F50E2C12D3A100912352 /* AddEditActivityView.swift in Sources */,
				B1A2F50F2C12D3A100912353 /* ProgressView.swift in Sources */,
				B1A2F5202C12D3A100912354 /* AssistantView.swift in Sources */,
				B1A2F5222C12D3A100912355 /* ProfileView.swift in Sources */,
				B1A2F5242C12D3A100912356 /* SettingsView.swift in Sources */,
				B1A2F5262C12D3A100912357 /* LifeFlowApp.swift in Sources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXSourcesBuildPhase section */

/* Begin PBXFrameworksBuildPhase section */
		B1A2F5332C12D3A100912365 /* Frameworks */ = {
			isa = PBXFrameworksBuildPhase;
			buildActionMask = 2147483647;
			files = (
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXFrameworksBuildPhase section */

/* Begin XCConfigurationList section */
		B1A2F52D2C12D3A10091235B /* Build configuration list for PBXNativeTarget "LifeFlow" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				B1A2F53B2C12D3A10091235C /* Debug */,
				B1A2F53C2C12D3A10091235D /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
		B1A2F5362C12D3A100912368 /* Build configuration list for PBXProject "LifeFlow" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				B1A2F53D2C12D3A100912369 /* Debug */,
				B1A2F53E2C12D3A10091236A /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
/* End XCConfigurationList section */

/* Begin XCBuildConfiguration section */
		B1A2F53B2C12D3A10091235C /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
				ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
				CODE_SIGN_STYLE = Automatic;
				CURRENT_PROJECT_VERSION = 1;
				DEVELOPMENT_ASSET_PATHS = "";
				DEVELOPMENT_TEAM = "";
				ENABLE_PREVIEWS = YES;
				GENERATE_INFOPLIST_FILE = YES;
				INFOPLIST_KEY_CFBundleDisplayName = LifeFlow;
				INFOPLIST_KEY_LSApplicationCategoryType = "public.app-category.lifestyle";
				INFOPLIST_KEY_NSLocalNotificationUsageDescription = "LifeFlow a besoin de t'envoyer des rappels d'activités pour t'aider à rester discipliné.";
				INFOPLIST_KEY_UIApplicationSceneManifest_Generation = YES;
				INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents = YES;
				INFOPLIST_KEY_UILaunchScreen_Generation = YES;
				INFOPLIST_KEY_UIRequiredDeviceCapabilities = arm64;
				INFOPLIST_KEY_UISupportedInterfaceOrientations = UIInterfaceOrientationPortrait;
				IPHONEOS_DEPLOYMENT_TARGET = 17.0;
				LD_RUNPATH_SEARCH_PATHS = (
					"$(inherited)",
					"@executable_path/Frameworks",
				);
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = fr.driss.lifeflow;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_EMIT_LOC_STRINGS = YES;
				SWIFT_VERSION = 5.0;
				TARGETED_DEVICE_FAMILY = "1";
			};
			name = Debug;
		};
		B1A2F53C2C12D3A10091235D /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
				ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
				CODE_SIGN_STYLE = Automatic;
				CURRENT_PROJECT_VERSION = 1;
				DEVELOPMENT_ASSET_PATHS = "";
				DEVELOPMENT_TEAM = "";
				ENABLE_PREVIEWS = YES;
				GENERATE_INFOPLIST_FILE = YES;
				INFOPLIST_KEY_CFBundleDisplayName = LifeFlow;
				INFOPLIST_KEY_LSApplicationCategoryType = "public.app-category.lifestyle";
				INFOPLIST_KEY_NSLocalNotificationUsageDescription = "LifeFlow a besoin de t'envoyer des rappels d'activités pour t'aider à rester discipliné.";
				INFOPLIST_KEY_UIApplicationSceneManifest_Generation = YES;
				INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents = YES;
				INFOPLIST_KEY_UILaunchScreen_Generation = YES;
				INFOPLIST_KEY_UIRequiredDeviceCapabilities = arm64;
				INFOPLIST_KEY_UISupportedInterfaceOrientations = UIInterfaceOrientationPortrait;
				IPHONEOS_DEPLOYMENT_TARGET = 17.0;
				LD_RUNPATH_SEARCH_PATHS = (
					"$(inherited)",
					"@executable_path/Frameworks",
				);
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = fr.driss.lifeflow;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_EMIT_LOC_STRINGS = YES;
				SWIFT_VERSION = 5.0;
				TARGETED_DEVICE_FAMILY = "1";
			};
			name = Release;
		};
		B1A2F53D2C12D3A100912369 /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ALWAYS_SEARCH_USER_PATHS = NO;
				CLANG_ANALYZER_NONNULL = YES;
				CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
				CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
				CLANG_ENABLE_MODULES = YES;
				CLANG_ENABLE_OBJC_ARC = YES;
				CLANG_ENABLE_OBJC_WEAK = YES;
				COPY_PHASE_STRIP = NO;
				DEBUG_INFORMATION_FORMAT = dwarf;
				ENABLE_STRICT_OBJC_MSGSEND = YES;
				ENABLE_TESTABILITY = YES;
				GCC_C_LANGUAGE_STANDARD = gnu11;
				GCC_DYNAMIC_NO_PIC = NO;
				GCC_NO_COMMON_BLOCKS = YES;
				GCC_OPTIMIZATION_LEVEL = 0;
				GCC_PREPROCESSOR_DEFINITIONS = (
					"DEBUG=1",
					"$(inherited)",
				);
				GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
				GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
				GCC_WARN_UNDECLARED_SELECTOR = YES;
				GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
				GCC_WARN_UNUSED_FUNCTION = YES;
				GCC_WARN_UNUSED_VARIABLE = YES;
				IPHONEOS_DEPLOYMENT_TARGET = 17.0;
				MTL_ENABLE_DEBUG_INFO = INCLUDE_SOURCE;
				MTL_FAST_MATH = YES;
				ONLY_ACTIVE_ARCH = YES;
				SDKROOT = iphoneos;
				SWIFT_ACTIVE_COMPILATION_CONDITIONS = DEBUG;
				SWIFT_OPTIMIZATION_LEVEL = "-Onone";
			};
			name = Debug;
		};
		B1A2F53E2C12D3A10091236A /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ALWAYS_SEARCH_USER_PATHS = NO;
				CLANG_ANALYZER_NONNULL = YES;
				CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
				CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
				CLANG_ENABLE_MODULES = YES;
				CLANG_ENABLE_OBJC_ARC = YES;
				CLANG_ENABLE_OBJC_WEAK = YES;
				COPY_PHASE_STRIP = YES;
				DEBUG_INFORMATION_FORMAT = "dwarf-with-dsym";
				ENABLE_NS_ASSERTIONS = NO;
				ENABLE_STRICT_OBJC_MSGSEND = YES;
				GCC_C_LANGUAGE_STANDARD = gnu11;
				GCC_NO_COMMON_BLOCKS = YES;
				GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
				GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
				GCC_WARN_UNUSED_FUNCTION = YES;
				GCC_WARN_UNUSED_VARIABLE = YES;
				IPHONEOS_DEPLOYMENT_TARGET = 17.0;
				MTL_ENABLE_DEBUG_INFO = NO;
				MTL_FAST_MATH = YES;
				SDKROOT = iphoneos;
				SWIFT_COMPILATION_MODE = wholemodule;
				SWIFT_OPTIMIZATION_LEVEL = "-O";
				VALIDATE_PRODUCT = YES;
			};
			name = Release;
		};
/* End XCBuildConfiguration section */
	};
	rootObject = B1A2F5352C12D3A100912367 /* Project object */;
}"""
    with open("LifeFlow.xcodeproj/project.pbxproj", "w", encoding="utf-8") as f:
        f.write(pbxproj_content)
        
    print("[LifeFlow] Xcode project configurations written successfully!")
    
    # 6. Create Shared Schemes for command-line xcodebuild compatibility
    os.makedirs("LifeFlow.xcodeproj/xcshareddata/xcschemes", exist_ok=True)
    scheme_content = """<?xml version="1.0" encoding="UTF-8"?>
<Scheme
   LastUpgradeVersion = "1500"
   version = "1.7">
   <BuildAction
      parallelizeBuildables = "YES"
      buildImplicitDependencies = "YES">
      <BuildActionEntries>
         <BuildActionEntry
            buildForTesting = "YES"
            buildForRunning = "YES"
            buildForProfiling = "YES"
            buildForArchiving = "YES"
            buildForAnalyzing = "YES">
            <BuildableReference
               BuildableIdentifier = "primary"
               BlueprintIdentifier = "B1A2F52C2C12D3A10091235A"
               BuildableName = "LifeFlow.app"
               BlueprintName = "LifeFlow"
               ReferencedContainer = "container:LifeFlow.xcodeproj">
            </BuildableReference>
         </BuildActionEntry>
      </BuildActionEntries>
   </BuildAction>
   <TestAction
      buildConfiguration = "Debug"
      selectedDebuggerIdentifier = "Xcode.DebuggerFoundation.Debugger.LLDB"
      selectedLauncherIdentifier = "Xcode.DebuggerFoundation.Launcher.LLDB"
      shouldUseLaunchSchemeArgsEnv = "YES">
      <Testables>
      </Testables>
   </TestAction>
   <LaunchAction
      buildConfiguration = "Debug"
      selectedDebuggerIdentifier = "Xcode.DebuggerFoundation.Debugger.LLDB"
      selectedLauncherIdentifier = "Xcode.DebuggerFoundation.Launcher.LLDB"
      launchStyle = "0"
      useLaunchSchemeArgsEnv = "YES"
      runOnlyForDeploymentPostprocessing = "NO"
      askForAppToLaunch = "YES">
      <BuildableProductRunnable
         runnableDebuggingMode = "0">
         <BuildableReference
            BuildableIdentifier = "primary"
            BlueprintIdentifier = "B1A2F52C2C12D3A10091235A"
            BuildableName = "LifeFlow.app"
            BlueprintName = "LifeFlow"
            ReferencedContainer = "container:LifeFlow.xcodeproj">
         </BuildableReference>
      </BuildableProductRunnable>
   </LaunchAction>
   <ProfileAction
      buildConfiguration = "Release"
      shouldUseLaunchSchemeArgsEnv = "YES"
      savedToolIdentifier = ""
      useLaunchSchemeArgsEnv = "YES"
      runOnlyForDeploymentPostprocessing = "NO">
      <BuildableProductRunnable
         runnableDebuggingMode = "0">
         <BuildableReference
            BuildableIdentifier = "primary"
            BlueprintIdentifier = "B1A2F52C2C12D3A10091235A"
            BuildableName = "LifeFlow.app"
            BlueprintName = "LifeFlow"
            ReferencedContainer = "container:LifeFlow.xcodeproj">
         </BuildableReference>
      </BuildableProductRunnable>
   </ProfileAction>
   <AnalyzeAction
      buildConfiguration = "Debug">
   </AnalyzeAction>
   <ArchiveAction
      buildConfiguration = "Release"
      revealArchiveInOrganizer = "YES">
   </ArchiveAction>
</Scheme>"""
    with open("LifeFlow.xcodeproj/xcshareddata/xcschemes/LifeFlow.xcscheme", "w", encoding="utf-8") as f:
        f.write(scheme_content)
    print("[LifeFlow] Shared scheme created at LifeFlow.xcodeproj/xcshareddata/xcschemes/LifeFlow.xcscheme")
    print("[LifeFlow] Ready to compile via GitHub Actions.")

if __name__ == "__main__":
    create_project()
