import privateClient from "../client/private.client";

const endpoints = {
  getAll: "Report/get-all-infor",
  getSale:({month,year}) => `Report/get-sales-month/month=${month}&year=${year}`
};

const reportApi = {
  getAll: async () => {
    try {
      const response = await privateClient.get(
        endpoints.getAll
      );
      return { response };
    } catch (err) {
      return { err };}
  },
  getSale: async ({month,year}) => {
    try {
      const response = await privateClient.get(
        endpoints.getSale({month,year})
      );
      return { response };
    } catch (err) {
      return { err };}
  },
};
export default reportApi;