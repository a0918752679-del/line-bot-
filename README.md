# 新北市打擊噪音車管理系統 V71

## 本版修正

修正後端平台登入頁錯誤：

```json
{
  "ok": false,
  "error": "escHtml is not defined"
}
```

原因是後端登入頁誤用前端頁面 script 內的 `escHtml()`。V71 已改為後端專用 `serverEscHtml()`，並新增 GET `/admin-login` 自動導回 `/admin-gate.html`。

## Rich Menu

- 單頁 Rich Menu。
- 不分兩頁。
- 不使用上下掀頁。
- 使用最新圖檔：`public/assets/line-rich-menu-main.jpg`。
- `public/assets` 僅保留：
  - `line-rich-menu-main.jpg`
  - `ntpc-emblem.png`
  - `README_RICH_MENU.txt`

## 隱藏後端平台入口

在 Rich Menu 右下角連續點擊三下，Bot 會提供後端平台入口。  
開啟後輸入管理密碼。

建議 Zeabur 環境變數：

```env
ADMIN_PASSWORD=69677323
ADMIN_SESSION_MINUTES=60
SESSION_SECRET=請設定一組隨機字串
```

## Google Sheet 自動同步

保留：

- Zeabur 服務啟動後自動同步
- 定時同步
- 一鍵更新後同步

建議環境變數：

```env
AUTO_SYNC_SHEETS_ON_STARTUP=true
GSHEET_SYNC_INTERVAL_MIN=15
```

## 部署後確認

部署後 Zeabur log 應顯示：

```text
newtaipei-noise-control-system-v71-clean-richmenu-admin-login-fix-autosync
```

後端入口：

```text
/admin-gate.html
```

登入成功後進入：

```text
/admin.html
```

診斷：

```text
/healthz
/api/deploy/check
/api/admin/line/rich-menu-diagnostics
```
