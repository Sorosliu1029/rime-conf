# 我的小鶴雙拼客製化方案

[Rime](https://rime.im) 小鶴雙拼輸入方案，基於 [雾凇拼音](https://github.com/iDvel/rime-ice)，並啓用 [萬象語法模型](https://github.com/amzxyz/RIME-LMDG)。

## 安裝

本方案依賴於

  - [雾凇拼音](https://github.com/iDvel/rime-ice) ℞ **`iDvel/rime-ice:others/recipes/full`**
  - [萬象語法模型](https://github.com/amzxyz/RIME-LMDG) `wanxiang-lts-zh-hans.gram`

一鍵安裝／更新（需要 git、curl，會自動下載 [東風破](https://github.com/rime/plum) 至 `~/plum`）：

```bash
bash install.sh
```

然後在鼠鬚管選單中「重新部署」。

## 文件說明

| 文件 | 作用 |
|---|---|
| `default.custom.yaml` | 方案列表（僅小鶴雙拼）、中西文切換鍵、候選數 |
| `double_pinyin_flypy.custom.yaml` | 默認西文、萬象語法模型 |
| `melt_eng.custom.yaml`、`radical_pinyin.custom.yaml` | 英文混輸、部件拆字反查使用小鶴雙拼 |
| `custom_phrase_double.txt` | 自定義短語（按鍵編碼，置頂） |
| `squirrel.custom.yaml` | 鼠鬚管外觀、各應用默認西文 |

⚠️

- `*.custom.yaml` 與 `custom_phrase_double.txt` 爲客製化文件，`install.sh` 會複製進[用戶資料夾](https://github.com/rime/home/wiki/UserData)
- 日期時間：輸入 `date`、`time`、`week`（由雾凇拼音的 `date_translator.lua` 提供）

授權條款：見 [LICENSE](LICENSE)
