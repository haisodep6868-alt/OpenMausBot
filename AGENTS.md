# OpenMausBot Agent Guidelines & Rules

Tài liệu này quy định các nguyên tắc phát triển bắt buộc dành cho AI Agent khi can thiệp vào mã nguồn OpenMausBot trong hệ sinh thái **H-KTO**.

---

## 1. Quy Trình 4 Bước Bắt Buộc (Mandatory Execution Workflow)

1. **Đọc ngữ cảnh trước:**
   - Luôn đọc kỹ [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) (hiểu quy ước kiến trúc, luồng hoạt động) và [`docs/CURRENT_SPEC.md`](docs/CURRENT_SPEC.md) (hiểu yêu cầu cụ thể của nhiệm vụ) **trước khi** sửa bất kỳ file mã nguồn nào.
2. **Tuân thủ thiết kế:**
   - Thực hiện chính xác cấu trúc file, tên hàm và logic nghiệp vụ được mô tả trong specs.
   - Không tự ý thay đổi kiến trúc tổng thể hoặc cài đặt các thư viện ngoài danh mục cho phép.
   - Giao diện UI tuân thủ nghiêm ngặt [`DESIGN.md`](DESIGN.md).
3. **Kiểm thử bắt buộc:**
   - Tự động viết hoặc cập nhật unit tests/verification scripts và chạy kiểm tra trước khi hoàn tất.
   - Tham khảo hướng dẫn xác minh tại [`docs/verification/README.md`](docs/verification/README.md). Luôn khởi tạo fixture độc lập, không test mutation trực tiếp trên dữ liệu người dùng.
4. **Cập nhật tài liệu & Báo cáo:**
   - Khi hoàn tất, cập nhật trạng thái trong [`docs/TASK_BOARD.md`](docs/TASK_BOARD.md) (và `docs/ARCHITECTURE.md` nếu cấu trúc thay đổi).
   - Báo cáo rõ ràng: Trạng thái, danh sách file thay đổi, kết quả build/test, kết quả `git status`.
   - Chờ phê duyệt của Chủ sở hữu trước khi commit hoặc push lên GitHub.

---

## 2. Quy Ước Viết Ghi Chú Mã Nguồn (Code Comments)

Chỉ viết comment cho những điều mà mã nguồn không thể tự biểu đạt:
- Thông báo bản quyền hoặc attribution notice;
- Thực tế bị ép buộc bởi yếu tố ngoại vi (nhà cung cấp, CLI, OS, trình duyệt, Electron hoặc protocol), kèm số phiên bản nếu có;
- Doc comment của public contract: wire types trong `shared/`, driver interface, preload bridge, các trường `config.json` người dùng có thể chỉnh sửa;
- Liên kết đến upstream issue;
- Một security invariant hoặc rủi ro mở đã biết.

**Tuyệt đối KHÔNG:**
- Diễn giải dòng code tiếp theo làm gì;
- Nhắc lại tên biến/hàm;
- Ghi lại lịch sử chỉnh sửa ("used to", "no longer", số PR/issue, tên kế hoạch: Git đã lưu);
- Trỏ tới file khác bằng comment rải rác;
- Vẽ banner ASCII hoặc để lại code bị comment-out.

---

## 3. Quy Định Thương Hiệu H-KTO (H Orbit V1.0)

- Thư mục tài sản gốc `D:\H-KTO-Brand` là **READ ONLY**.
- Tuyệt đối **không hardcode** đường dẫn phát triển `D:\H-KTO-Brand` vào mã nguồn runtime, bundle hoặc file thực thi.
- Mọi tài sản đồ họa cần sử dụng phải được sao chép vào thư mục tài nguyên nội bộ của dự án (ví dụ `src/assets/` hoặc `electron/assets/`).
- Giữ nguyên tỷ lệ, màu sắc chuẩn của logo thương hiệu H-KTO.
