import { z } from "zod";
const passwordRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
export const SignInSchema = z.object({
  email: z.string().email("Yêu cầu là email. Ví dụ: example@gmail.com").min(1, "Yêu cầu là email. Ví dụ: example@gmail.com"),
  password: z.string()
    .min(8, "Mật khẩu phải có ít nhất 8 ký tự")
    .regex(passwordRegex, "Mật khẩu phải chứa ít nhất một chữ cái viết hoa, một số, và một ký tự đặc biệt"),
});


export const ChangePasswordSchema = z.object({
  password: z.string()
    .min(8, "Mật khẩu phải có ít nhất 8 ký tự")
    .regex(passwordRegex, "Mật khẩu phải chứa ít nhất một chữ cái viết hoa, một số, và một ký tự đặc biệt"),
  newPassword: z.string()
  .min(8, "Mật khẩu phải có ít nhất 8 ký tự")
  .regex(passwordRegex, "Mật khẩu phải chứa ít nhất một chữ cái viết hoa, một số, và một ký tự đặc biệt"),
  confirmNewPassword:z.string().min(3, "Mật khẩu phải nhiều hơn 3 ký tự")
}).refine((data) => data.newPassword === data.confirmNewPassword, {
  message: "Mật khẩu xác nhận chưa trùng khớp!",
  path: ["confirmNewPassword"] }).refine((data) => data.password !== data.newPassword, {
  message: "Mật khẩu mới phải khác mật khẩu hiện tại!",
  path: ["newPassword"]
});


export const DogItemSchema = z.object({
  dogName: z.string().min(3, "Tên sản phẩm nhiều hơn 3 ký tự"),
  speciesName: z.string(),
  price: z.coerce
  .number({
    required_error: "Hãy nhập giá",
    invalid_type_error: "Hãy nhập giá",
  })
  .int()
  .positive("Hãy nhập giá trị hợp lệ"),
  color: z.string().min(1, "Hãy nhập màu sắc"),
  sex: z.enum(["male", "female"]),
  age: z.coerce.number().positive("Tuổi phải lớn hơn 0").max(200, "Số tháng quá lớn"),
  origin: z.string().min(1, "Hãy nhập nguồn gốc"),
  healthStatus: z.string().min(1, "Hãy nhập tình trạng sức khỏe"),
  description: z.string().min(1, "Hãy nhập mô tả")
});

export const ItemSchema = z.object({
  itemName: z.string().min(3, "Tên sản phẩm nhiều hơn 3 ký tự"),
  category: z.string().min(1, "Nhập loại sản phẩm"),
  price: z.coerce
  .number({
    required_error: "Hãy nhập giá",
    invalid_type_error: "Hãy nhập giá",
  })
  .int()
  .positive("Hãy nhập giá trị hợp lệ"),
  quantity: z.coerce.number().positive("Số lượng phải lớn hơn 0").int(),
  description: z.string().min(1, "Hãy nhập mô tả")
});

export const InvoiceSchema = z.object({
  name: z.string().min(1, "Yêu cầu"),
  email: z.string().email("Yêu cầu là email. Ví dụ: example@gmail.com").min(1, "Yêu cầu là email. Ví dụ: example@gmail.com"),
  phoneNumber:z.string().min(6, "Yêu cầu"),
  address: z.string().min(1, "Yêu cầu")
});

export const VoucherShema = z.object({
  code: z.string().min(1, "Yêu cầu"),
  discount_value:z.coerce.number().positive(),
  max_usage: z.coerce.number().positive().int().max(200, "Số tháng quá lớn")
});

export const BookingSchema = z.object({
  result: z.string()
});