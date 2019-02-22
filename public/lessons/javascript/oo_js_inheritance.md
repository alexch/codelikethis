# OOJS: Object Inheritance

# `extends`

```
class Dog extends Mammal {
... [todo]
}
```

# Don't Overuse Inheritance!

Inheritance works best when: 

* used to share *implementation* but not *interface*
* hierarchies are *shallow* (less than 3 levels)

# The Upstairs-Downstairs Problem

```
class Dialog {
  render() {
    return 
      '<div class="dialog">' +

  }
}

class LoginDialog extends Dialog {

}
```
