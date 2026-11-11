# My Xiaohe Shuangpin (小鹤双拼) Rime config

[Rime](https://rime.im) config for 小鹤双拼 on Squirrel (鼠鬚管), built on [rime-ice 雾凇拼音](https://github.com/iDvel/rime-ice) with the [wanxiang grammar model](https://github.com/amzxyz/RIME-LMDG) for better first-candidate accuracy.

## Install / update

Requires git and curl. Downloads [plum](https://github.com/rime/plum) to `~/plum` if missing.

```bash
bash install.sh
```

Then **鼠鬚管 → 重新部署** (Deploy). Run the same command later to update rime-ice's dictionaries; it never touches your learned words.

## Files

| File | Purpose |
|---|---|
| `default.custom.yaml` | Schema list (小鹤双拼 only), ASCII-mode switch keys, 9 candidates per page |
| `double_pinyin_flypy.custom.yaml` | Start in ASCII mode; wanxiang grammar model |
| `melt_eng.custom.yaml`, `radical_pinyin.custom.yaml` | English words and 拆字 lookup typed with 双拼 keys |
| `custom_phrase_double.txt` | Pinned phrases (code = exact keys typed) |
| `squirrel.custom.yaml` | Theme, font, apps that start in ASCII mode |

Only put changes in these `*.custom.yaml` / `custom_phrase_double.txt` files. rime-ice's own files (`*.schema.yaml`, `rime_ice.dict.yaml`, `default.yaml`, …) are overwritten on every update.

## Cheat sheet

### Symbols: `V` + pinyin initials of the category name

| Type | Category | Initials | Examples |
|---|---|---|---|
| `Vsx` | 数学 math | **s**hù **x**ué | ± × ÷ ≠ ≈ ≤ ≥ √ ∑ ∫ ∞ ∈ ∩ ∪ |
| `Vxl` / `Vxld` | 希腊 Greek (+ 大写 upper) | **x**ī **l**à (**d**à) | α β π λ / Δ Σ Ω |
| `Vsb` / `Vxb` | 上标 / 下标 super / subscript | **s**hàng **b**iāo / **x**ià **b**iāo | ¹ ² ³ / ₁ ₂ ₃ |
| `Vfs` | 分数 fraction | **f**ēn **s**hù | ½ ⅓ ¼ |
| `Vjt` | 箭头 arrow | **j**iàn **t**óu | → ← ⇒ ↔ |
| `Vdw` | 单位 unit | **d**ān **w**èi | ° ℃ ‰ ㎏ |
| `Vjh` | 几何 shapes | **j**ǐ **h**é | ■ □ ▲ ◆ |
| `Vbq` | 表情 emoticon | **b**iǎo **q**íng | ☺ ☹ |
| `V` + letter/digit | variants | | `V2` → ² ₂ ② |
| `Vhelp` | **list of all categories** | | |

Codes are full-pinyin initials, not 双拼 keys (上标 is `sb`). Full list: [symbols_caps_v.yaml](https://github.com/iDvel/rime-ice/blob/main/symbols_caps_v.yaml).

### Other triggers

| Type | Result |
|---|---|
| `date` / `time` / `week` | 2026-11-10 / 18:13 / 星期二 (several formats each) |
| `datetime` / `timestamp` | ISO 8601 / Unix timestamp |
| `lunar` | Today in the Chinese lunar calendar |
| `N20261110` | Convert a date to the lunar calendar |
| `R1234.5` | Chinese numerals / 大写金额 (壹仟贰佰…) |
| `cC2*3+1` | Calculator → `7` |
| `U221a` | Unicode code point → √ |
| `uU` + pinyin of parts | Look up a character by its components (拆字), e.g. `uUririri` → 晶 |
| `uuid` | Random UUID |
| 双拼 + <code>&#96;</code> + component pinyin | Filter candidates by a component (辅码), e.g. <code>jk&#96;ri</code> → 晶 (jing with 日) |
| emoji | Typing a word like 开心 / 火箭 offers 😄 / 🚀 as a candidate |
| `mygmail`, `cmd`, `return` | Own phrases from `custom_phrase_double.txt` |

### Keys

| Key | Action |
|---|---|
| `Space` | First candidate |
| `[` / `]` | Commit only the **first / last character** of the highlighted word (以词定字) |
| `-` / `=` | Previous / next page |
| `Tab` / `Shift+Tab` | Move cursor to next / previous syllable |
| `Return` | Commit the raw keys as typed |
| `Ctrl+Delete` (`Ctrl+fn+⌫`) | Remove a wrongly learned word from your user dictionary |
| Right `Shift` | Toggle Chinese / ASCII mode (commits what's typed) |
| `Ctrl+Shift+3` | Toggle Chinese / ASCII punctuation |
| `Ctrl+Shift+4` | Toggle Simplified / Traditional output |
| <code>Cmd+&#96;</code> or <code>Ctrl+Shift+&#96;</code> | Rime menu (switches for emoji, full-width, …) |

## Tuning accuracy

- **Rime learns from you.** Picking a non-first candidate raises it next time; give it a few days after the migration.
- **Wrong word learned?** Highlight it and press `Ctrl+Delete`.
- **Pin a candidate for a code** (e.g. always 了 first for `le`): add to `double_pinyin_flypy.custom.yaml`, using full-pinyin codes because the preedit shows full pinyin:

  ```yaml
  patch:
    pin_cand_filter/+:
      - "le	了"
  ```

- **Add your own phrase:** append `text<Tab>code` to `custom_phrase_double.txt`. Use codes that aren't valid 双拼 sequences (whole English words, odd letter combos); a pinned phrase on a real 双拼 code pushes the Chinese word off `Space`.
- **Add a word list:** see the rime-ice README section on extending dictionaries (link below).

After any change: copy the file to `~/Library/Rime` (or rerun `install.sh`) and redeploy.

## Rollback

The pre-migration user folder is at `~/Library/Rime.backup-20261110`. To restore, swap the folders, then redeploy:

```bash
mv ~/Library/Rime ~/Library/Rime.rime-ice && mv ~/Library/Rime.backup-20261110 ~/Library/Rime
```

## Links

- [rime-ice README](https://github.com/iDvel/rime-ice#readme): install, updating, FAQ (grammar model, how to customize)
- [rime-ice blog post](https://dvel.me/posts/rime-ice/): design notes and extra tips
- [rime-ice schema for 小鹤双拼](https://github.com/iDvel/rime-ice/blob/main/double_pinyin_flypy.schema.yaml): every option, commented
- [RIME-LMDG](https://github.com/amzxyz/RIME-LMDG): the grammar model
- [Rime customization guide](https://github.com/rime/home/wiki/CustomizationGuide): how `*.custom.yaml` patches work

License: see [LICENSE](LICENSE)
