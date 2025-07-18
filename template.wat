(module $klyx_extension_template.wasm
  (type (;0;) (func (param i32 i32)))
  (type (;1;) (func))
  (import "Android" "show_toast_impl" (func $_ZN18klyx_extension_api7android15show_toast_impl17h4d409e078b3bef8cE (type 0)))
  (func $init (type 1)
    i32.const 1048576
    i32.const 23
    call $_ZN18klyx_extension_api7android10show_toast17h098488d1b7c0c12aE)
  (func $_ZN18klyx_extension_api7android10show_toast17h098488d1b7c0c12aE (type 0) (param i32 i32)
    local.get 0
    local.get 1
    call $_ZN18klyx_extension_api7android15show_toast_impl17h4d409e078b3bef8cE)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 17)
  (global $__stack_pointer (mut i32) (i32.const 1048576))
  (global (;1;) i32 (i32.const 1048599))
  (global (;2;) i32 (i32.const 1048608))
  (export "memory" (memory 0))
  (export "init" (func $init))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (data $.rodata (i32.const 1048576) "Hello from MyExtension."))
