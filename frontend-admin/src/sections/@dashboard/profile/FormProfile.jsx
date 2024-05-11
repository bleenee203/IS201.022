import Button from "@mui/material/Button";
import Box from "@mui/material/Box";
import TextField from "@mui/material/TextField";
import { ChangePasswordSchema } from "~/configs/zod.config";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { useState } from "react";
import Alert from "@mui/material/Alert";
import { LoadingButton } from "@mui/lab";
import { Dialog, DialogActions, DialogContent, DialogTitle } from "@mui/material";
import { toast } from "react-toastify";
import authApi from "~/apis/modules/auth.api";

const FormProfile = ({ user }) => {
  const [userData, setUserData] = useState(user);
  const [isLoading, setIsLoading] = useState(false);
  const [openDialog, setOpenDialog] = useState(false);
  const [dialogData, setDialogData] = useState({
    username:user?.username,
    firstname:user?.firstName,
    lastname:user?.lastName,
    phonenumber: user?.phoneNumber
  });
  const [errors, setErrors] = useState({});
  const [touchedFields, setTouchedFields] = useState({});
  const handleOpenDialog = () => {
    setDialogData({
      username: user?.username || '',
      firstname: user?.firstName || '',
      lastname: user?.lastName || '',
      phonenumber: user?.phoneNumber || ''
    });
    setErrors({});
    setTouchedFields({});
    setOpenDialog(true);
  };
  const handleCloseDialog = () => {
    setOpenDialog(false);
  };
  const handleDialogInputChange = (e) => {
    setDialogData({
      ...dialogData,
      [e.target.name]: e.target.value
    });
    setErrors({ ...errors, [e.target.name]: "" });
  };
  const isValidPhoneNumber = (phoneNumber) => {
    const phoneRegex = /^(0|\+84)(3[2-9]|5[6|8|9]|7[0|6-9]|8[1-9]|9\d)\d{7}$/;
    return phoneRegex.test(phoneNumber);
  };
  const updateUser = async (data) => {
    try {
      console.log("data",data)
      setIsLoading(true);
      const { response, err } = await authApi.updateUser(
        { UserName:data.username,
          FirstName:data.firstname,
          LastName:data.lastname,
          PhoneNumber:data.phonenumber}
      ); // Gọi API cập nhật thông tin người dùng
      if (response) {
        toast.success("Cập nhật thông tin người dùng thành công!");
        setUserData({
          ...userData,
          username: data.username,
          firstName: data.firstname,
          lastName: data.lastname,
          phoneNumber: data.phonenumber
        });
      }
      if (err) {
        toast.error(err.message);
      }
    } catch (error) {
      console.log(error);
      toast.error("Đã xảy ra lỗi khi cập nhật thông tin người dùng!");
    } finally {
      setIsLoading(false);
    }
  };
  const handleUpdateUser = () => {
    const updatedErrors = {};
  let hasError = false;
  // Kiểm tra mỗi trường và xác thực dữ liệu
  if (!dialogData.username.trim()) {
    updatedErrors.username = "Vui lòng nhập tên người dùng";
    hasError = true;
  }
  if (!dialogData.firstname.trim()) {
    updatedErrors.firstname = "Vui lòng nhập họ";
    hasError = true;
  }
  if (!dialogData.lastname.trim()) {
    updatedErrors.lastname = "Vui lòng nhập tên";
    hasError = true;
  }
  const phoneNumber = dialogData.phonenumber.trim();
  if (!phoneNumber) {
    updatedErrors.phonenumber = "Vui lòng nhập số điện thoại";
    hasError = true;
  } else if (!isValidPhoneNumber(phoneNumber)) {
    updatedErrors.phonenumber = "Số điện thoại không hợp lệ";
    hasError = true;
  }

  // Nếu có lỗi, cập nhật state và ngăn chặn quá trình cập nhật
  if (hasError) {
    setErrors(updatedErrors);
    return;
  }
      updateUser(dialogData);
      handleCloseDialog();
    
  };
  return (
    <div>
<Box sx={{ p: 3 }} display="flex" flexDirection="column" gap={4} component="form">
      <Box display="flex" alignItems="center" gap={5}>
        <TextField
          label="Họ"
          type="text"
          value={userData?.firstName}
          sx={{ maxWidth:"200px" }}
        />
        <TextField
          label="Tên"
          type="text"
          value={userData?.lastName}
          sx={{ maxWidth:"200px" }}
        />
      </Box>
      <TextField
        label="Username"
        type="text"
        value={userData?.username}
        sx={{ maxWidth:"400px" }}
      />
      <TextField
        label="Email"
        type="email"
        value={userData?.email}
        sx={{ maxWidth:"400px" }}
      />
      <TextField
        label="Số điện thoại"
        type="text"
        value={user?.phoneNumber}
        sx={{ maxWidth:"400px" }}
      />
      <Button variant="contained" sx={{ width:"200px" }} onClick={handleOpenDialog}>Cập nhật</Button>
    </Box>
    <Dialog open={openDialog} onClose={handleCloseDialog} >
        <DialogTitle>Cập Nhật Thông Tin Người Dùng</DialogTitle>
        <Box sx={{ height: 10 }} />
        <DialogContent >
        <TextField
          // {
          // ...register("username")
          // }
            name="username"
            fullWidth
            label="Username"
            value={dialogData?.username}
            onChange={handleDialogInputChange}
            error={errors.username && touchedFields.username}
  helperText={errors.username}
  onBlur={() => setTouchedFields({ ...touchedFields, username: true })}
          />
          <Box sx={{ height: 20 }} />
          <TextField
            // {
            //   ...register("firstname")
            //   }
            name="firstname"
            fullWidth
            label="Họ"
            value={dialogData?.firstname}
            onChange={handleDialogInputChange}
            error={errors.firstname && touchedFields.firstname}
            helperText={errors.firstname}
            onBlur={() => setTouchedFields({ ...touchedFields, firstname: true })}
          />
          <Box sx={{ height: 20 }} />
          <TextField
          // {
          //   ...register("lastname")
          //   }
          name="lastname"
            fullWidth
            label="Tên"
            value={dialogData?.lastname}
            onChange={handleDialogInputChange}
            error={errors.lastname && touchedFields.lastname}
            helperText={errors.lastname}
            onBlur={() => setTouchedFields({ ...touchedFields, lastname: true })}
          />
          <Box sx={{ height: 20 }} />
          <TextField
          // {
          //   ...register("phonenumber")
          //   }
          name="phonenumber"
            fullWidth
            label="Số Điện Thoại"
            value={dialogData?.phonenumber}
            onChange={handleDialogInputChange}
            error={errors.phonenumber && touchedFields.phonenumber}
            helperText={errors.phonenumber}
            onBlur={() => setTouchedFields({ ...touchedFields, phonenumber: true })}
          />
        </DialogContent>
        <DialogActions>
          <Button type="submit" onClick={handleCloseDialog}>Hủy</Button>
          <Button type="submit" onClick={handleUpdateUser} color="primary">Cập Nhật</Button>

        </DialogActions>
      </Dialog>

    </div>
  );
};

export default FormProfile;