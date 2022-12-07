# OpenWrt DVB feed
Just copy/clone to package directory of OpenWrt SDK. Run 'make' to build with
package defaults or 'make menuconfig' to select build options, and then 'make'
to build it. Sugestions, improvements are welcomed.
Have Fun.

Keep in mind that a real device may require a **set of modules** to operate
which might **are not selected together** automatically. Do not forget to
select all of them by hand. You can use linuxtv.org's wiki to determinate
what components are used by your device or use desktop Linux to see what
modules are loaded when the device is inserted.

Building with only SDK is supported at the moment. Sorry. This is because only
SDK provides stable kernel configuration. Without it we could introduce
unending "dependency hell" or failed compilations.
