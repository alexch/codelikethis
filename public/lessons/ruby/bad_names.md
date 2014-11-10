# Bad Names

| name | why it's bad | alternative |
|---|---|---|
| `Fixnum` | obscure jargon | `Integer` |
| `attr_accessor` | "access" implies reading, not writing | `attribute` |
| default block | "default" is misleading  | anonymous block |
| default hash | "default" is misleading  | automatic hash |
| `case` | comprises many cases, not one case | `switch` or `compare` |
| `equal?` |compares identity (object_id), not equality | `identical?` |
| `yield` | implies thread/process swap | `call` |

and in Rails...

| name | why it's bad | alternative |
|---|---|---|
| `attr_accessible` | it's about setting, not accessing | `mass_assignable` |
| `html_safe` | its content will *not* be escaped in views | `html_dangerous` or `raw` |

