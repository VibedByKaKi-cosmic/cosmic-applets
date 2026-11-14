// Copyright 2023 System76 <info@system76.com>
// SPDX-License-Identifier: GPL-3.0-only

use cosmic::cosmic_config::{self, CosmicConfigEntry, cosmic_config_derive::CosmicConfigEntry};
use serde::{Deserialize, Serialize};

/// Chooses which tray items go into the overflow popup.
///
/// Items are named by their StatusNotifierItem `Id` property.
#[derive(Default, Debug, Clone, Serialize, Deserialize, CosmicConfigEntry, PartialEq, Eq)]
#[version = 1]
pub struct StatusAreaConfig {
    /// Items that never move to the overflow popup. They come first in the bar.
    #[serde(default)]
    pub pinned_items: Vec<String>,
    /// Items that go to the overflow popup even when the bar has room for them.
    #[serde(default)]
    pub overflow_items: Vec<String>,
    /// Put every item except `pinned_items` in the overflow popup.
    #[serde(default)]
    pub always_overflow: bool,
}
