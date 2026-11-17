# Đặc Tả Kỹ Thuật Hiện Tại (CURRENT_SPEC.md)

Tài liệu này ghi nhận trạng thái cấu hình hiện thời, các tiêu chí nghiệm thu và kế hoạch phát triển cho OpenMausBot.

---

## 1. Trạng Thái Môi Trường & Cấu Hình

- **Repo fork:** `https://github.com/haisodep6868-alt/OpenMausBot.git` (remote: `origin`)
- **Repo upstream:** `https://github.com/milind-soni/OpenMausBot.git` (remote: `upstream`)
- **Nhánh làm việc:** `dev` (đã checkout từ `main`)
- **Môi trường nền tảng:**
  - Node.js: `v24.10.0` (đạt yêu cầu `>= 24`)
  - pnpm: `v10.33.0` (đạt yêu cầu `v10.33+`)
  - Claude Code CLI: `@anthropic-ai/claude-code` `2.1.326` (Global)
  - OpenAI Codex CLI: `@openai/codex` `0.169.0` (Global)
  - Cloudflared connector: `2026.10.3` (staged cho `win32-x64`)
  - Electron: `43.7.9` (đã nạp binary và pass `check:electron`)

---

## 2. Tiêu Chí Nghiệm Thu (Acceptance Criteria)

- [x] Node.js >= 24 và pnpm v10.33+ đã sẵn sàng trên hệ thống.
- [x] Hai engine CLI (`claude` và `codex`) đã được cài đặt global qua npm và nhận diện lệnh trong terminal.
- [x] Repo fork được clone về đúng vị trí `D:\OpenMausBot`.
- [x] Cấu hình upstream trỏ về `https://github.com/milind-soni/OpenMausBot.git`.
- [x] Nhánh `dev` được khởi tạo và đang ở trạng thái active.
- [x] `pnpm install` chạy thành công không có lỗi thiếu thư viện.
- [x] `pnpm build` biên dịch thành công toàn bộ TypeScript và assets.
- [x] Đã khởi tạo đầy đủ bộ tài liệu kiến trúc chuẩn: `AGENTS.md`, `docs/ARCHITECTURE.md`, `docs/CURRENT_SPEC.md`, `docs/TASK_BOARD.md`.
- [x] Ứng dụng Desktop được kích hoạt thành công qua cụm dev server & `pnpm dev:desktop`.

---

## 3. Quy Ước Phát Triển Tính Năng Mới

Khi thực hiện bất kỳ thay đổi nào tiếp theo:
1. **Đọc ngữ cảnh trước:** Luôn đọc `docs/ARCHITECTURE.md` và `docs/CURRENT_SPEC.md`.
2. **Tuân thủ thiết kế:** Giữ nguyên quy ước đặt tên và cấu trúc monorepo.
3. **Kiểm thử bắt buộc:** Chạy biên dịch và kiểm tra tính năng trước khi báo cáo hoàn tất.
4. **Báo cáo & Phê duyệt:** Cập nhật bảng công việc tại `docs/TASK_BOARD.md` và chờ chủ sở hữu duyệt trước khi push lên nhánh từ xa.
