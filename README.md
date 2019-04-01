# vim-charbar

Lightweight single-character scrollbar. Emulates the behavior of the `%P`
statusline field.

## Usage

Charbar is intended to be used with `'statusline'`/`'rulerformat'`:

```
let g:charbar_bar_style = 'braille'

let &statusline = '... %{charbar#Char()} ...'
```

## Customization

The character that's displayed can be customized by setting
`g:charbar_bar_style` and `g:charbar_arrow_style`.

### Bar styles

| Name | Characters |
| --- | --- |
| `line` | `‾` `⎺` `⎻` `―` `—` `⎼` `⎽` `_` |
| `braille` | `⠁` `⠉` `⠋` `⠛` `⠟` `⠿` `⡿` `⣿` |
| `block` | `█` `▇` `▆` `▅` `▄` `▃` `▂` `▁` |

### Arrow styles

| Name | Characters |
| --- | --- |
| `arrow` | `↑` `↓` |
| `triangle` | `▴` `▾` |

