# IS201.022
**Cài đặt
- Backend
Tạo file appsettings.json và copy nội dung của file file example.json vào
Tạo database rỗng trong mssql tương ứng với tên database trong appsettings.json
Mở NuGet - Package Manager Console, chạy lệnh update database
- Frontend(cả user và admin
Tạo file .env
Nội dung file .env: VITE_BASE_URL=https://localhost:7189/api
Chạy lệnh npm install để tải các package

**Chạy
- Backend
Chạy lệnh dotnet run hoặc nhấn nút run project trong Visual Studio
Có thể test các api bằng Postman hoặc Swagger 
- Frontend
Chạy lệnh npm run dev

**Chú ý
- Tạm thời chức năng đăng ký đang có bug => tạo tài khoản user và admin bằng back-end(không nên tạo trong database) và đăng nhập bình thường
- Tài khoản admin sau khi tạo một thời gian sẽ bị block => có lỗi CORS => tạo lại tài khoản(đang kiếm cách fix :)))) )
- Một số chức năng user-manager đang có bug...
 
