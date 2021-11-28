#include <Preferences/PSListController.h>
#include <CepheiPrefs/HBAppearanceSettings.h>
#include <CepheiPrefs/HBListController.h>
#include <UIKit/UIKit.h>
#include "spawn.h"

@interface AWARootListController : PSListController
@property (nonatomic, retain) UIBarButtonItem *applyButton;
@end
