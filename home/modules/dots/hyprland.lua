---------------
---- INPUT ----
---------------
---
hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

hl.monitor({
	output = "desc:LG Electronics LG ULTRAGEAR+ 312NTDVCQ138",
	mode = "highrr",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = "desc:BOE 0x0A3B",
	mode = "preferred",
	position = "auto-down",
	scale = 1,
})

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XCURSOR_SIZE", "20")
hl.env("HYPRCURSOR_SIZE", "20")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("GDK_BACKEND", "wayland")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)

hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("noctalia")
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 20")
	hl.exec_cmd("wl-paste --watch cliphist store")
	hl.exec_cmd("vicinae server")
	hl.exec_cmd("/usr/sbin/pypr")
end)

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
-- require("noctalia/noctalia-colors.conf")

hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 3,

		border_size = 2,

		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = true,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 15,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 0.67,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 10,
			passes = 2,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "slidevert" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "slidevert" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "slidevert" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
	master = {
		new_status = "master",
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

----------------
----  MISC  ----
----------------

hl.config({
	misc = {
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
		focus_on_activate = true,
	},
})

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Suppress maximize events from all windows
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- Fix XWayland dragging issues
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- Fix XWayland visual artifacts
hl.window_rule({
	match = { xwayland = true, title = "win[0-9]+" },
	no_dim = true,
	no_shadow = true,
	rounding = 10,
})

-- Bitwarden
hl.window_rule({
	match = { class = "^Bitwarden$" },
	no_screen_share = true,
	tag = "+floating-window",
})

-- winboat, freerdp
hl.window_rule({
	match = { class = "^(winboat|xfreerdp)$" },
	workspace = "5",
})

-- 1Password
hl.window_rule({
	match = { class = "^1[pP]assword$" },
	no_screen_share = true,
	tag = "+floating-window",
})

-- Localsend
hl.window_rule({
	match = { class = "Share|localsend" },
	float = true,
	center = true,
})

-- Oryx Configurator (ZSA)
hl.window_rule({
	match = { class = "^chrome-configure\\.zsa\\.io__voyager_layouts_default_latest_0-Default$" },
	float = true,
	center = true,
	max_size = { 1920, 1080 },
})

-- Terminal touchpad scroll
hl.window_rule({
	match = { class = "^(foot|kitty|ghostty)$" },
	scroll_touchpad = 1.5,
})
hl.window_rule({
	match = { class = "com.mitchellh.ghostty" },
	scroll_touchpad = 0.2,
})

-- File picker dialogs
hl.window_rule({
	match = { title = "(?i)^(Open File|Save|Save As|Export|Import|Choose File|Rename)$" },
	float = true,
	center = true,
})
hl.window_rule({
	match = { class = "^(xdg-desktop-portal-gtk|xdg-desktop-portal-hyprland)$" },
	float = true,
	center = true,
})
hl.window_rule({
	match = { title = "(?i)^(save as)" },
	float = true,
})
hl.window_rule({
	match = { title = "^(.*Properties.*)$" },
	float = true,
})

-- Blueman
hl.window_rule({
	match = { class = "^blueman-manager$" },
	float = true,
	size = { 500, 400 },
})

-- Chrome PWAs (by hash)
hl.window_rule({
	match = { class = "^chrome-dnfpoenibinnbbckgbhendmlljoobcfg-Default$" },
	float = true,
	center = true,
	size = { 1412, 1067 },
})
hl.window_rule({
	match = { class = "^chrome-npohjiicjkdgpklifclfkafodaegmlnl-Default$" },
	float = true,
	center = true,
	size = { 1412, 1067 },
})

-- PulseAudio / pavucontrol
hl.window_rule({
	match = { class = "^org\\.pulseaudio\\.pavucontrol$" },
	float = true,
	size = { 500, 400 },
})

-- TLPUI
hl.window_rule({
	match = { class = "^tlpui" },
	float = true,
	size = { 1000, 700 },
})

-- Image viewers
hl.window_rule({
	match = { class = "^(imv|org\\.kde\\.gwenview)$" },
	float = true,
	center = true,
	size = { 1200, 800 },
})

-- Qalculate
hl.window_rule({
	match = { title = "^Qalculate!$" },
	float = true,
	center = true,
	size = { 600, 500 },
})

-- Signal
hl.window_rule({
	name = "Signal",
	match = { class = "signal" },
	float = true,
	center = true,
	size = { 1200, 800 },
})

-- Floating update popup
hl.window_rule({
	match = { class = "^floating-update$" },
	float = true,
	center = true,
	size = { 800, 800 },
})

-- GNOME Boxes → workspace 4
hl.window_rule({
	match = { class = "^org\\.gnome\\.Boxes$" },
	workspace = "4",
	float = true,
	center = true,
	size = { 1200, 800 },
})

-- Nautilus
hl.window_rule({
	match = { class = "^org\\.gnome\\.Nautilus$" },
	float = true,
	center = true,
	size = { 1200, 800 },
})

-- Dolphin
hl.window_rule({
	match = { class = "^org\\.kde\\.dolphin$" },
	float = true,
	center = true,
	size = { 1200, 800 },
})

-- Picture-in-Picture
hl.window_rule({
	match = { title = "Picture.?in.?[Pp]icture" },
	tag = "+pip",
	float = true,
	pin = true,
	size = { 600, 338 },
	keep_aspect_ratio = true,
	border_size = 0,
	opacity = "1 1",
	move = "100%-w-40 4%",
})

-- QEMU
hl.window_rule({
	match = { class = "qemu" },
	opacity = "1 1",
})

-- RetroArch
hl.window_rule({
	match = { class = "^com\\.libretro\\.RetroArch$" },
	fullscreen = true,
	opacity = "1 1",
	idle_inhibit = "fullscreen",
})

-- Steam
hl.window_rule({
	match = { class = "steam" },
	float = true,
	opacity = "1 1",
	idle_inhibit = "fullscreen",
})
hl.window_rule({
	match = { class = "steam", title = "Steam" },
	center = true,
	size = { 1100, 700 },
})
hl.window_rule({
	match = { class = "steam", title = "Friends List" },
	size = { 460, 800 },
})

-- Floating-window tag: float + center + size
hl.window_rule({
	match = { tag = "floating-window" },
	float = true,
	center = true,
	size = { 875, 600 },
})

-- Tag additional apps as floating-window
hl.window_rule({
	match = {
		class = "^(xdg-desktop-portal-gtk|xdg-desktop-portal-hyprland|sublime_text|DesktopEditors|org\\.gnome\\.Nautilus)$",
		title = "^(Open.*Files?|Open [Ff]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to (?:open|save).*|[Cc]hoose.*)$",
	},
	tag = "+floating-window",
})

-- Hyprshot: no animation on selection layer
hl.layer_rule({
	name = "no-anim-hyprshot-selection",
	match = { namespace = "selection" },
	no_anim = true,
})

-- Browser tags
hl.window_rule({
	match = { class = "^((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium)$" },
	tag = "+chromium-based-browser",
})
hl.window_rule({
	match = { class = "^([fF]irefox|zen|librewolf)$" },
	tag = "+firefox-based-browser",
})

-- Force chromium into tiling (--app bug workaround)
hl.window_rule({
	match = { tag = "chromium-based-browser" },
	tile = true,
})

-- Browser opacity
hl.window_rule({
	match = { tag = "chromium-based-browser" },
	opacity = "1 0.97",
})
hl.window_rule({
	match = { tag = "firefox-based-browser" },
	opacity = "1 0.97",
})

-- Override opacity for video sites
hl.window_rule({
	match = { initial_title = "(?i)(?:[a-z0-9-]+\\.)*youtube\\.com_/|app\\.zoom\\.us_/wc/home" },
	opacity = "1.0 1.0",
})

-- Vicinae blur
hl.layer_rule({
	match = { namespace = "vicinae" },
	name = "vicinae-blur",
	blur = true,
	ignore_alpha = 0,
})

-- pypr expose
hl.workspace_rule({
	workspace = "special:scratchpad",
	gaps_out = 60,
	gaps_in = 30,
	border_size = 5,
})

-- Virt-Manager -> workspace 3
hl.window_rule({
	match = { class = "^virt-manager$" },
	workspace = "3",
})

-- Workspace 1 bind to Laptop Monitor
hl.workspace_rule({
	workspace = "1",
	monitor = "eDP-1",
	default = true,
	layout = "monocle",
})

-- Workspace 3 bind to scrolling layout
hl.workspace_rule({
	workspace = "3",
	layout = "scrolling",
})

--------------------------
---- BASE KEYBINDINGS ----
--------------------------
-- Core Hyprland keybinds that work on any system
-- Independent of shell/launcher/custom scripts

local mod = "SUPER"
local term = "kitty"
local browser = "zen"
local files = "nautilus"

-----------------------
---- APPLICATIONS -----
-----------------------

hl.bind(mod .. " + T", hl.dsp.exec_cmd(term), { description = "Launch terminal" })
hl.bind(mod .. " + B", hl.dsp.exec_cmd(browser), { description = "Launch browser" })
-- hl.bind(
-- 	mod .. " + Space",
-- 	hl.dsp.exec_cmd("pkill rofi || rofi -show drun -replace -i"),
-- 	{ description = "Toggle application launcher" }
-- )
hl.bind(mod .. " + E", hl.dsp.exec_cmd("pkill " .. files .. " || " .. files), { description = "Toggle file explorer" })

-----------------------
---- WINDOW MGMT ------
-----------------------

hl.bind(mod .. " + Q", hl.dsp.window.kill(), { description = "Close active window" })
hl.bind("CTRL + ALT + F", hl.dsp.window.fullscreen({ action = "toggle" }), { description = "Toggle fullscreen" })
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
-- hl.bind(mod .. " + SHIFT + V", hl.dsp.exec_cmd(toggleallfloat), { description = "Toggle all floating" })
hl.bind(mod .. " + P", hl.dsp.window.pseudo({ action = "toggle" }), { description = "Pseudo-tile window" })
hl.bind(mod .. " + backslash", hl.dsp.layout("togglesplit"), { description = "Toggle split direction" }) -- verify: not in wiki, may be hl.dsp.layout("togglesplit")

-- Focus windows
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "l" }), { description = "Focus left" })
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "r" }), { description = "Focus right" })
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "u" }), { description = "Focus up" })
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "d" }), { description = "Focus down" })
hl.bind(mod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "d" }))

-- Swap windows
hl.bind(mod .. " + ALT + H", hl.dsp.window.swap({ direction = "l" }), { description = "Swap left" })
hl.bind(mod .. " + ALT + L", hl.dsp.window.swap({ direction = "r" }), { description = "Swap right" })
hl.bind(mod .. " + ALT + K", hl.dsp.window.swap({ direction = "u" }), { description = "Swap up" })
hl.bind(mod .. " + ALT + J", hl.dsp.window.swap({ direction = "d" }), { description = "Swap down" })
hl.bind(mod .. " + ALT + left", hl.dsp.window.swap({ direction = "l" }))
hl.bind(mod .. " + ALT + right", hl.dsp.window.swap({ direction = "r" }))
hl.bind(mod .. " + ALT + up", hl.dsp.window.swap({ direction = "u" }))
hl.bind(mod .. " + ALT + down", hl.dsp.window.swap({ direction = "d" }))

-- Cycle through windows
hl.bind("ALT + ESCAPE", function()
	hl.dispatch(hl.dsp.window.cycle_next({ tiled = true }))
	hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end, { repeating = true })

hl.bind(
	mod .. " + F",
	hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }),
	{ description = "Maximize window" }
)
hl.bind(
	mod .. " + SHIFT + F",
	hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }),
	{ description = "Fullscreen window" }
)

-----------------------
---- RESIZE MODE ------
-----------------------

hl.bind(mod .. " + R", hl.dsp.submap("resize"), { description = "Enter resize mode" })

hl.define_submap("resize", function()
	hl.bind("H", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { description = "Resize left" })
	hl.bind("L", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), { description = "Resize right" })
	hl.bind("K", hl.dsp.window.resize({ x = 0, y = -100, relative = true }), { description = "Resize up" })
	hl.bind("J", hl.dsp.window.resize({ x = 0, y = 100, relative = true }), { description = "Resize down" })
	hl.bind("left", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
	hl.bind("right", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
	hl.bind("up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
	hl.bind("down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))
	hl.bind("Escape", hl.dsp.submap("reset"), { description = "Exit resize mode" })
end)

-- Quick resize (outside resize mode)
hl.bind(
	"ALT + CTRL + SHIFT + H",
	hl.dsp.window.resize({ x = -100, y = 0, relative = true }),
	{ description = "Quick resize left" }
)
hl.bind(
	"ALT + CTRL + SHIFT + L",
	hl.dsp.window.resize({ x = 100, y = 0, relative = true }),
	{ description = "Quick resize right" }
)
hl.bind(
	"ALT + CTRL + SHIFT + K",
	hl.dsp.window.resize({ x = 0, y = -100, relative = true }),
	{ description = "Quick resize up" }
)
hl.bind(
	"ALT + CTRL + SHIFT + J",
	hl.dsp.window.resize({ x = 0, y = 100, relative = true }),
	{ description = "Quick resize down" }
)
hl.bind("ALT + CTRL + SHIFT + left", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
hl.bind("ALT + CTRL + SHIFT + right", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
hl.bind("ALT + CTRL + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
hl.bind("ALT + CTRL + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))

-----------------------
---- WORKSPACES -------
-----------------------

-- Navigate to workspace
for i = 1, 9 do
	hl.bind(mod .. " + " .. i, hl.dsp.focus({ workspace = i }), { description = "Switch to workspace " .. i })
end
hl.bind(mod .. " + 0", hl.dsp.focus({ workspace = 10 }), { description = "Switch to workspace 10" })

-- Cycle workspaces
hl.bind(mod .. " + comma", hl.dsp.focus({ workspace = "e-1" }), { description = "Previous workspace" })
hl.bind(mod .. " + period", hl.dsp.focus({ workspace = "e+1" }), { description = "Next workspace" })

-- Move window to workspace
for i = 1, 9 do
	hl.bind(
		mod .. " + SHIFT + " .. i,
		hl.dsp.window.move({ workspace = i }),
		{ description = "Move to workspace " .. i }
	)
end
hl.bind(mod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }), { description = "Move to workspace 10" })

-- Special workspace (scratchpad)
hl.bind(mod .. " + X", hl.dsp.workspace.toggle_special("magic"), { description = "Toggle special workspace" })
hl.bind(
	mod .. " + SHIFT + X",
	hl.dsp.window.move({ workspace = "special:magic" }),
	{ description = "Move to special workspace" }
)

-- Scroll through workspaces with mouse wheel
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-----------------------
---- SYSTEM CONTROL ---
-----------------------

-- hl.bind("CTRL + ALT + L",      hl.dsp.exec_cmd("hyprlock"),  { description = "Lock screen" })
-- hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd("wlogout"),   { description = "Power menu" })
hl.bind(mod .. " + CTRL + R", hl.dsp.exec_cmd("hyprctl reload"), { description = "Reload Hyprland" })

-----------------------
---- MOUSE BINDINGS ---
-----------------------

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-----------------------
---- MULTIMEDIA -------
-----------------------

-- Volume control
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeating = true })

-- Brightness control
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { repeating = true })

-- Media playback
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

------------------------------
---- EXTERNAL COMMANDS -------
------------------------------

hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd("noctalia msg panel-toggle session"), { description = "Session menu" })
hl.bind("CTRL + ALT + L", hl.dsp.exec_cmd("noctalia msg session lock"), { description = "Lock screen" })
hl.bind(mod .. " + Space", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"), { description = "Launcher toggle" })
hl.bind(mod .. " + W", hl.dsp.exec_cmd("noctalia msg panel-toggle wallpaper"), { description = "Wallpaper selector" })
hl.bind(
	mod .. " + ALT + S",
	hl.dsp.exec_cmd("noctalia msg settings-toggle"),
	{ description = "Toggle noctalia system settings" }
)

hl.bind("Print", hl.dsp.exec_cmd("noctalia msg screenshot-region"), { description = "Screenshot" })
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("noctalia msg screenshot-region"), { description = "Screenshot" })

hl.bind("ALT + Space", hl.dsp.exec_cmd("vicinae toggle"), { description = "Vicinae Launcher toggle" })

---------------------------
---- PYPR SCRATCHPADS -----
---------------------------

hl.bind(mod .. " + ALT + B", hl.dsp.exec_cmd("pypr toggle btop"), { description = "Toggle btop scratchpad" })
-- hl.bind(mod .. " + ALT + C", hl.dsp.exec_cmd("pypr toggle signal"), { description = "Toggle Signal scratchpad" })
hl.bind(
	mod .. " + CTRL + R",
	hl.dsp.exec_cmd("hyprctl reload && pypr reload"),
	{ description = "Reload Hyprland + pypr" }
)

---------------------------
---- APP SHORTCUTS --------
---------------------------

hl.bind(
	mod .. " + ALT + U",
	hl.dsp.exec_cmd(term .. " --class floating-update -e update"),
	{ description = "System update" }
)

