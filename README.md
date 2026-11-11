# 我的小鶴雙拼客製化方案

[Rime](https://rime.im) 鼠鬚管小鶴雙拼配置，基於 [雾凇拼音 rime-ice](https://github.com/iDvel/rime-ice)，並啓用 [萬象語法模型](https://github.com/amzxyz/RIME-LMDG)，提升首選準確率。

## 安裝／更新

需要 git 及 curl；若無 [東風破 plum](https://github.com/rime/plum)，會自動下載至 `~/plum`。

```bash
bash install.sh
```

然後在鼠鬚管選單中「重新部署」。日後更新雾凇詞庫也是執行同一命令，不會影響已學習的用戶詞。

## 文件說明

| 文件 | 作用 |
|---|---|
| `default.custom.yaml` | 方案列表（僅小鶴雙拼）、中西文切換鍵、每頁 9 個候選 |
| `double_pinyin_flypy.custom.yaml` | 默認西文、萬象語法模型 |
| `melt_eng.custom.yaml`、`radical_pinyin.custom.yaml` | 英文混輸、部件拆字反查使用小鶴雙拼編碼 |
| `custom_phrase_double.txt` | 自定義短語（編碼 = 實際按鍵，置頂） |
| `squirrel.custom.yaml` | 鼠鬚管外觀、字體、各應用默認西文 |

⚠️ 只修改上述 `*.custom.yaml` 及 `custom_phrase_double.txt`。雾凇自帶的文件（`*.schema.yaml`、`rime_ice.dict.yaml`、`default.yaml` 等）每次更新都會被覆蓋。

## 速查表

### 符號：`V` + 類別名稱的拼音首字母

| 輸入 | 類別 | 首字母 | 示例 |
|---|---|---|---|
| `Vsx` | 數學 | **s**hù **x**ué | ± × ÷ ≠ ≈ ≤ ≥ √ ∑ ∫ ∞ ∈ ∩ ∪ |
| `Vxl` / `Vxld` | 希臘字母（＋大寫） | **x**ī **l**à（**d**à） | α β π λ / Δ Σ Ω |
| `Vsb` / `Vxb` | 上標／下標 | **s**hàng **b**iāo / **x**ià **b**iāo | ¹ ² ³ / ₁ ₂ ₃ |
| `Vfs` | 分數 | **f**ēn **s**hù | ½ ⅓ ¼ |
| `Vjt` | 箭頭 | **j**iàn **t**óu | → ← ⇒ ↔ |
| `Vdw` | 單位 | **d**ān **w**èi | ° ℃ ‰ ㎏ |
| `Vjh` | 幾何 | **j**ǐ **h**é | ■ □ ▲ ◆ |
| `Vbq` | 表情 | **b**iǎo **q**íng | ☺ ☹ |
| `V` + 字母／數字 | 變體 | | `V2` → ² ₂ ② |
| `Vhelp` | **列出全部類別** | | |

編碼是全拼首字母，不是雙拼按鍵（上標是 `sb`）。完整列表：[symbols_caps_v.yaml](https://github.com/iDvel/rime-ice/blob/main/symbols_caps_v.yaml)。

### 其他觸發

| 輸入 | 結果 |
|---|---|
| `date` / `time` / `week` | 2026-11-10 / 18:13 / 星期二（各有多種格式） |
| `datetime` / `timestamp` | ISO 8601 / Unix 時間戳 |
| `lunar` | 今日農曆 |
| `N20261110` | 公曆轉農曆 |
| `R1234.5` | 中文數字／大寫金額（壹仟貳佰……） |
| `cC2*3+1` | 計算器 → `7` |
| `U221a` | Unicode 碼位 → √ |
| `uU` + 部件拼音 | 部件拆字反查，如 `uUririri` → 晶 |
| `uuid` | 隨機 UUID |
| 雙拼 + <code>&#96;</code> + 部件拼音 | 輔碼篩選候選，如 <code>jk&#96;ri</code> → 晶（jing 且含「日」） |
| Emoji | 輸入「开心」「火箭」等詞，候選中會出現 😄 🚀 |
| `cmd`、`return` | `custom_phrase_double.txt` 中的自定義短語 |

### 按鍵

| 按鍵 | 作用 |
|---|---|
| `空格` | 上屏首選 |
| `[` / `]` | 以詞定字：只上屏選中詞的**首字／末字** |
| `-` / `=` | 上一頁／下一頁 |
| `Tab` / `Shift+Tab` | 光標移至下一個／上一個音節 |
| `回車` | 上屏原始按鍵 |
| `Ctrl+Delete`（`Ctrl+fn+⌫`） | 從用戶詞庫刪除錯誤學習的詞 |
| 右 `Shift` | 切換中文／西文（並上屏已輸入的編碼） |
| `Ctrl+Shift+3` | 切換中／英標點 |
| `Ctrl+Shift+4` | 切換簡／繁輸出 |
| <code>Cmd+&#96;</code> 或 <code>Ctrl+Shift+&#96;</code> | Rime 選單（Emoji、全角等開關） |

## 調整準確率

- **Rime 會學習你的選擇。** 選了非首選的候選，下次會排得更前；遷移後需幾天適應。
- **學錯了詞？** 選中該候選，按 `Ctrl+Delete`。
- **固定某編碼的首選**（如 `le` 總是「了」）：加到 `double_pinyin_flypy.custom.yaml`。編碼要寫全拼，因爲輸入框顯示的是全拼：

  ```yaml
  patch:
    pin_cand_filter/+:
      - "le	了"
  ```

- **添加自定義短語：** 在 `custom_phrase_double.txt` 末尾加 `詞彙<Tab>編碼`。編碼要用不構成雙拼的組合（完整英文單詞、少見字母組合）；若用了真實的雙拼編碼，置頂短語會把中文首選擠下空格。
- **添加詞庫：** 見下方雾凇 README 中擴充詞庫的說明。

改完後：把文件複製到 `~/Library/Rime`（或重新執行 `install.sh`），再重新部署。

## 參考鏈接

- [雾凇拼音 README](https://github.com/iDvel/rime-ice#readme)：安裝、更新、常見問題（語法模型、如何客製化）
- [雾凇拼音博客](https://dvel.me/posts/rime-ice/)：設計說明及更多技巧
- [雾凇小鶴雙拼方案](https://github.com/iDvel/rime-ice/blob/main/double_pinyin_flypy.schema.yaml)：所有選項，附註釋
- [RIME-LMDG](https://github.com/amzxyz/RIME-LMDG)：語法模型
- [Rime 定製指南](https://github.com/rime/home/wiki/CustomizationGuide)：`*.custom.yaml` 補靪的原理

授權條款：見 [LICENSE](LICENSE)
