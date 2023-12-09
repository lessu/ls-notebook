# Rust Programing Manual

## Callback style

1. Avoiding using observer/delegate/listener mode.unless all your object are using `Rc` or `Arc`.or the owner ship is almost un-resolvable.
2. Recommends to use clousure(Fn/FnMut/FnOnce).Cell is required to store clousure
3. Bare function is also usable,but  `* const ()` ( or `void *`) convert is unsafe.

**2.Clousure Tips**

To use self in clousure.Use `RefCell` instead of self.

**Example**

```rust
let mut me = RefCell::new(self);

ps2.connect_rx_notify(|d,e|{
  me.get_mut().on_rx_notify(d,e)
});
ps2.connect_tx_complete(|e|{
  me.get_mut().on_tx_finished(e);
});

me.get_mut().ps2_protocol.replace(ps2);

```

**Storing Clousure**

```rust
/* use alloc crate */
extern crate alloc;
use alloc::boxed::Box;

/* store in struct */
struct A{
	rx_notify:Box<dyn FnMut(&[u8],ErrorType)>
}

/* use */
pub fn connect_rx_notify(&self,func:impl FnMut(&[u8],ErrorType)){
  self.rx_notify = Box::new(func);
}
```





**3.Bare Function tip**

A example of  `*const () ` converts.

```rust
fn feature_request_update(e:UpdateEvent,_userdata:*const()){
   let app  = unsafe {
     &mut *(_userdata as *mut () as *mut PS2App)   
   };
   // todo://
}

self.set_active_event_fn(feature_request_update, self as *const PS2App as _ );

```

