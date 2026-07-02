# LINE Rich Menu UI/UX Plan V71

## 修正內容
- 修正後端平台登入頁 `/admin-login` 出現 `escHtml is not defined` 的問題。
- 改用 server-side `serverEscHtml()` 處理後端登入頁錯誤訊息。
- 新增 GET `/admin-login` 自動導回 `/admin-gate.html`，避免瀏覽器重新整理 POST URL 時顯示 JSON 錯誤。
- 保留 V70 最新乾淨版內容：
  - 單頁 Rich Menu
  - 隱藏後端平台入口
  - Google Sheet 自動同步
  - 強制刷新 LINE Rich Menu
  - `public/assets` 僅保留最新圖檔

## 後端入口
- Rich Menu 右下角連續點三下，Bot 提供入口。
- 或直接開 `/admin-gate.html`。
- 密碼預設 `69677323`，建議用 `ADMIN_PASSWORD` 設定。
