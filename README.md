# 新北市打擊噪音車管理系統 V56

本版重點：

- 套用新版淺色可掀式 LINE Rich Menu，功能字體與圖示加大，點選區更清楚。
- Rich Menu 移除 01 / 02 數字標示與「平台架構」。
- 「指令說明」改為 LINE 文字重點回覆，不再跳轉後台或指令網頁。
- 月份、行政區成果查詢只回覆執行數據，不產生 AI 建議。
- Google Sheet 連結改為 Sheet Secure Gateway：輸入關鍵字後，LINE 提供驗證視窗；密碼通過後才顯示連結。

## Google Sheet 連結查詢

LINE 輸入：

```text
Google Sheet 連結
表單連結
資料表連結
Sheet 連結
開啟試算表
```

Bot 會回覆「開啟驗證視窗」。使用者於視窗輸入密碼後才會顯示各 Sheet 連結。

必要環境變數：

```env
SHEET_LINK_PASSWORD=69677323
SHEET_LINK_SESSION_MINUTES=10
PUBLIC_BASE_URL=https://你的主控服務網址
```

## Rich Menu 更新

部署 Zeabur 後進入：

```text
/admin.html
```

點選「一鍵更新」或呼叫：

```text
POST /api/admin/line/update-rich-menu
```

## 測試指令

```bash
node -c server.js
node server.js
curl http://localhost:8080/api/line/simulate -H 'content-type: application/json' -d '{"text":"指令說明"}'
curl http://localhost:8080/api/line/simulate -H 'content-type: application/json' -d '{"text":"4月成果"}'
curl http://localhost:8080/api/line/simulate -H 'content-type: application/json' -d '{"text":"Google Sheet 連結"}'
```


## V57 更新
- 套用使用者確認的「上下掀頁版」Rich Menu 視覺。
- `public/assets/line-rich-menu-main.jpg`：外勤 / 內勤頁。
- Rich Menu 觸發區座標已依 V57 新版圖面重新標定。


## V58 更新
- 套用「更正式政府版」上下掀頁式 Rich Menu。
- 主頁：外勤 / 內勤；次頁：法規 / 資訊。
- 依新版圖面重新調整 Rich Menu 點擊區。


## V59 更新
- 已修正為兩張獨立 Rich Menu 圖，不再以單張長圖呈現。
- 使用 LINE `richmenuswitch` 做上下掀頁式切換。
- 主頁：外勤 / 內勤。
- 次頁：法規 / 資訊。
- Rich Menu 點擊座標已依 V59 圖面重新標定。


## V61 更新
- 套用兩張獨立生成的高解析 Rich Menu 圖。
- 非 LINE 使用畫面截圖，非單張長圖裁切。
- 主頁：外勤 / 內勤。
- 次頁：法規 / 資訊。
- 以 LINE richmenuswitch 實作上下掀頁式切換。
- Rich Menu 點擊座標已依 V61 圖面重新標定。


## V62 更新
- 使用使用者指定圖片作為 LINE Rich Menu 視覺基準。
- 已拆成兩張獨立 Rich Menu 圖：
  - `public/assets/line-rich-menu-main.jpg`
  - 保留上下掀頁視覺提示。
- 使用 LINE `richmenuswitch` 做頁面切換。
- 點擊座標已依 V62 圖面重新標定。


## V63 更新
- 改為單頁版 Rich Menu。
- 直接使用使用者提供圖片做為主視覺。
- 不分兩頁，不使用上下掀頁。
- `updateRichMenu()` 已改為只建立一張 Rich Menu。
- 點擊區已依單張圖版面重新標定。


## V64 更新
- 修正 V63 圖片可能超過 LINE Rich Menu 1MB 上傳限制的問題。
- 單頁 Rich Menu 圖已壓縮至 LINE 可上傳範圍內。
- `updateRichMenu()` 保持單頁建立。
- `/api/admin/line/update-rich-menu` 執行後會同步 Google Sheet。
- `/api/admin/line/update-all` 執行後會同步 Google Sheet。
- 新增啟動後自動同步與定期同步 Google Sheet。
- 建議環境變數：
  - `AUTO_SYNC_SHEETS_ON_STARTUP=true`
  - `GSHEET_SYNC_INTERVAL_MIN=15`


## V65 更新
- 清理 `public/assets` 中舊版 Rich Menu 圖檔。
- 僅保留最新單頁 Rich Menu：`public/assets/line-rich-menu-main.jpg`。
- 移除舊版 `rich-menu-vXX-preview`、`rich-menu-vXX-source-reference`、`line-rich-menu-info.jpg`、`line-rich-menu-single.jpg`，避免部署或人工套用時選錯圖。
- 保留 Google Sheet 自動同步與單頁 Rich Menu 更新機制。


## V66 更新
- 修正 Zeabur log 仍顯示 V56 的問題，改為 `newtaipei-noise-control-system-v66-single-richmenu-force-refresh-autosync`。
- 一鍵更新 Rich Menu 時改為強制刷新流程：
  - 建立新 Rich Menu
  - 上傳最新 `line-rich-menu-main.jpg`
  - 取消舊 default rich menu
  - 設定最新 Rich Menu 為 default
  - 清理本系統歷代 `NTPC Noise` 舊 Rich Menu
  - 自動同步 Google Sheet
- 新增診斷 API：`/api/admin/line/rich-menu-diagnostics`


## V67 更新
- 套用高科技儀表板式單頁 Rich Menu。
- 底部保留新北市打擊噪音車管理系統台頭橫幅。
- 右側大卡片為主要點擊區，提升手機使用直覺性。
- `public/assets` 僅保留最新 `line-rich-menu-main.jpg`，避免誤用。
- 保留 V66 強制刷新流程與 Google Sheet 自動同步。
- 新服務名稱：`newtaipei-noise-control-system-v67-hightech-dashboard-single-richmenu-autosync`
