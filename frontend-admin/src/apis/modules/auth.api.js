import publicClient from "../client/public.client";
import privateClient from "../client/private.client";

const endpoints = {
  signin: "Authenticate/login-admin",
  getInfo: "Authenticate/info",
  getAll: "Authenticate/get-all",
  changePassword: "Authenticate/change-password",
  updateInfo: "Authenticate/update-info-user"
};

const authApi = {
  signin: async ({ email, password }) => {
    try {
      const response = await privateClient.post(
        endpoints.signin,
        { email, password }
      );
      return { response };
    } catch (err) { return { err };}
  },
  getInfo: async () => {
    try {
      const response = await privateClient.get(endpoints.getInfo);
      return { response };
    } catch (err) {return { err };}
  },
  getAllUser: async () => {
    try {
      const response = await privateClient.get(endpoints.getAll);
      return { response };
    } catch (err) {return { err };}
  },
  changePassword: async ({ CurrentPassword , NewPassword, ConfirmNewPassword }) => {
    console.log(CurrentPassword, NewPassword, ConfirmNewPassword);
    try {
      const response = await privateClient.post(
        endpoints.changePassword,
        {ConfirmNewPassword,CurrentPassword, NewPassword }
      );
      return { response };
    } catch (err) {
      console.log("Error message:", err);
      return { err };
    }
  },
  updateUser: async ({UserName,FirstName,LastName,PhoneNumber}) => {
    try {
      const response = await privateClient.put(endpoints.updateInfo,{UserName,FirstName,LastName,PhoneNumber});
      return { response };
    } catch (err) { 
      console.log("Error message:", err);
      return { err }; }
  }
};

export default authApi;