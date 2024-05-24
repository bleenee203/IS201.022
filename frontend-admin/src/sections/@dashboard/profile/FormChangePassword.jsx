import Box from "@mui/material/Box";
import TextField from "@mui/material/TextField";
import Button from "@mui/material/Button";
import { ChangePasswordSchema } from "~/configs/zod.config";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { useEffect, useState } from "react";
import Alert from "@mui/material/Alert";
import { LoadingButton } from "@mui/lab";
import authApi from "~/apis/modules/auth.api";
import { toast } from "react-toastify";
import { useNavigate } from 'react-router-dom';

const FormChangePassword = ({user}) => {
  console.log("forgot",user);
  const [isLoginRequest, setIsLoginRequest] = useState(false);
  const [errorMessage, setErrorMessage] = useState();
  const [onRequest, setOnRequest] = useState(false);
  const navigate = useNavigate(); 

  const {
    register,
    formState: { errors, touchedFields },
    handleSubmit,
    reset
  } = useForm({
    resolver: zodResolver(ChangePasswordSchema)
  });

  // const onHandleSubmit = async (data) => {
  //   reset();
  //   setErrorMessage("password wrong");
  // };
  const onHandleSubmit = async (data) => {
    try {
      if (onRequest) return;
      setOnRequest(true);
      const { response, err } = await authApi.changePassword(
        {
          CurrentPassword: data.password,
          NewPassword: data.newPassword,
          ConfirmNewPassword: data.confirmNewPassword
        },
      );
      console.log(response);
      setOnRequest(false);
      if (err) {toast.error(err.message);return;}
      toast.success("Đổi mật khẩu thành công!");
      navigate('/');
    } catch (error) {
      toast.error(error.message);
    }
  };
  return (
    <>
      <Box sx={{ p: 3 }} display="flex" flexDirection="column" gap={4} component="form"
        onSubmit={handleSubmit(onHandleSubmit)}
      >
        <TextField
          label="Nhập mật khẩu"
          type="password"
          sx={{ maxWidth:"400px" }}
          {
            ...register("password")
          }
          name="password"
          error={touchedFields && errors?.password?.message !== undefined}
          helperText={touchedFields && errors?.password?.message}
        />
        <TextField
          label="Nhập mật khẩu mới"
          type="password"
          autoComplete="new-password"
          sx={{ maxWidth:"400px" }}
          {
            ...register("newPassword")
          }
          name="newPassword"
          error={touchedFields && errors?.newPassword?.message !== undefined}
          helperText={touchedFields && errors?.newPassword?.message}
        />
        <TextField
          label="Xác nhận mật khẩu mới"
          type="password"
          autoComplete="new-password"
          sx={{ maxWidth:"400px" }}
          {
            ...register("confirmNewPassword")
          }
          name="confirmNewPassword"
          error={touchedFields && errors?.confirmNewPassword?.message !== undefined}
          helperText={touchedFields && errors?.confirmNewPassword?.message}
        />
        <Box display="flex" alignItems="center" gap={2}>
          <LoadingButton
            type="submit"
            variant="contained"
            sx={{ width:"200px" }}
            //loading={isLoginRequest}
            loading={onRequest}
          >
        Lưu thay đổi
          </LoadingButton>
          <Button variant="text" sx={{ width:"200px", color:"error.main" }}
            onClick={() => reset()}
          >Hủy</Button>
        </Box>
      </Box>

      {errorMessage && (
        <Box sx={{ marginTop: 2 }}>
          <Alert severity="error" variant="outlined" >{errorMessage}</Alert>
        </Box>
      )}
    </>

  );
};

export default FormChangePassword;