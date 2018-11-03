# OpenWrt DVB feed
Just copy/clone to package directory of OpenWrt source tree or SDK.
Run 'make' to build with package defaults or 'make menuconfig'
to select build options, and then 'make' to build it.
Sugestions, improvements are welcomed.
Have Fun.

Keep in mind that a real device may require a **set of modules** to operate
which might **are not selected together** automatically. Do not forget to
select all of them by hand. You can use linuxtv.org's wiki to determinate
what components are used by your device.

It is strongly recommended to say "N" in menuconfig to the following:
`Kernel modules > Video Support > kmod-video-core`. Otherwise you may
be faced with building error.
