"/ VDB init script
"/ Current VDB instance (instance of VDBDebuggerApplication) can be accessed
"/ in via variable `vdb`
"/ Current GDB instance (instance of GDBDebugger) can be accessed via
"/ `vdb debugger`.

"/ Load plugins.
"/
"/   Smalltalk loadPackage: 'jv:vdb/plugins/bee'

"/ Set console prompt
"/
"/   vdb debugger send: 'set prompt (vdb) '.

"/ Set default text font for all text and list views
"/
VDBAbstractApplication defaultTextFont: (XftFontDescription family:#'DejaVu Sans Mono' face:#normal size:12).

"/ Choose debugger layout. For list of layouts, see VDBDebuggerApplicaton class,
"/ protocol 'interface specs - layouts'. Default is #layoutEclipseSpec.
"/
"/   vdb layout: #layoutEclipseSpec.
"/   vdb layout: #layoutIDAProSpec.
"/   vdb layout: #layoutSingleSpec.

"/ Enable pretty printers and frame filters in user interface.
"/ Very likely you want this, if you want to turn the off
"/ (not recommended), comment out following:
vdb debugger enablePrettyPrinting.
vdb debugger enableFrameFilters.

GDBArchitecture initialize.

