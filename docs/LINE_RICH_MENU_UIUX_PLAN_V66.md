# LINE Rich Menu UI/UX Plan V66

## 修正問題
- Zeabur log 舊版名稱誤導問題：更新 APP_VERSION 與 SERVICE_NAME。
- 一鍵更新後未套用最新單頁 Rich Menu 的排查問題：新增 force refresh 流程。
- 更新時會：
  1. 建立新的單頁 Rich Menu
  2. 上傳 `line-rich-menu-main.jpg`
  3. 取消舊 default rich menu
  4. 設定新的 default rich menu
  5. 清理名稱以 `NTPC Noise` 開頭的舊 rich menu
  6. 同步 Google Sheet 資料

## 診斷
- `/api/admin/line/rich-menu-diagnostics`
