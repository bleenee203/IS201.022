import { Helmet } from "react-helmet-async";
// @mui
import { useTheme } from "@mui/material/styles";
import { Grid, Container, Typography,Button } from "@mui/material";
import { useEffect, useState,useRef } from "react";
import Select from 'react-select';
// components
// sections
import {
  AppCurrentVisits,
  AppWebsiteVisits,
  AppWidgetSummary,
  AppCurrentSubject,
  AppConversionRates
} from "../sections/@dashboard/app";
import reportApi from "~/apis/modules/report.api";
import { CSVLink } from "react-csv";
import { DatePicker, LocalizationProvider } from "@mui/x-date-pickers";
import { AdapterDateFns } from "@mui/x-date-pickers/AdapterDateFns";
import { format } from "date-fns";

// ----------------------------------------------------------------------
export default function DashboardAppPage() {
  const [selectedDate, setSelectedDate] = useState(null);
  console.log(selectedDate?.getMonth()+1);
  const [dataToExport, setDataToExport] = useState([]);
  const handleDateChange = (date) => {
    setSelectedDate(date);
  };
  const [data, setData] = useState([]);
  const csvLinkRef = useRef();
  useEffect(() => {
    const get = async () => {
      try {
        const { response, err }= await reportApi.getAll();
        if (err) {
          toast.error(err);
        }
        if (response) {
          setData(response.value);
          console.log(response.value);
        }
      } catch (error) {
        console.log(error);
      }
    };
    get();
  }, []);
  const handleExportClick = async () => {
    var month = selectedDate?.getMonth()+1;
    var year = selectedDate?.getFullYear()
    const {response,err} =await reportApi.getSale({month,year});
    if (response) {
      const modifiedData = response.value.map(sale => ({
        'Ngày bán': format(new Date(sale.createAt), 'dd/MM/yyyy'),
        'Danh sách sản phẩm': sale.formattedData,
        'Tên khách hàng': sale.name,
        'Địa chỉ khách hàng': sale.address,
        'Số điện thoại khách hàng': sale.phoneNumber,
        'Tổng tiền': sale.total,
        'Tình trạng thanh toán': sale.payment
        }));
      setDataToExport(modifiedData);
      setTimeout(() => {
        csvLinkRef.current.link.click();
      }, 100);
      console.log(dataToExport)
    }
    if (err) {
      console.log(err);
    }
  };
  const [loading, setLoading] = useState(false);
  const theme = useTheme();
  return (
    <>
      <Helmet>
        <title> Dashboard | Pet Shop </title>
      </Helmet>

      <Container maxWidth="xl">
        <Typography variant="h4" sx={{ mb: 5 }}>
          Xin chào!
        </Typography>
        {/* <LocalizationProvider dateAdapter={AdapterDateFns}>
        <DatePicker
          views={['year', 'month']}
          label="Chọn tháng và năm"
          minDate={new Date('2000-01-01')}
          maxDate={new Date('2100-12-31')}
          value={selectedDate}
          onChange={handleDateChange}
          renderInput={(params) => <TextField {...params} helperText={null} />}
        />
      </LocalizationProvider>
      <br />
      <Button
        style={{ marginBottom: "20px",marginTop: "20px" }}
        color="warning"
        variant="outlined"
        onClick={handleExportClick}
        disabled={!selectedDate}
      > */}
        {/* <CSVLink
          data={dataToExport}
          filename={selectedDate ? `report-${format(selectedDate, 'MM-yyyy')}.csv` : 'report.csv'}
          target="_blank"
          style={{ textDecoration: 'none' }} 
        > */}
        {/* </CSVLink> */}
      {/* </Button> */}
      <CSVLink
        data={dataToExport}
        filename={selectedDate ? `report-${format(selectedDate, 'MM-yyyy')}.csv` : 'report.csv'}
        target="_blank"
        style={{ textDecoration: 'none', display: 'none' }} // Ẩn liên kết để chỉ tải khi dữ liệu sẵn sàng
        ref={csvLinkRef}
      >
        Tải xuống
      </CSVLink>
      {/* <Button
        style={{ marginBottom: "20px" }}
        color="warning"
        variant="outlined"
        onClick={handleExportClick}
        disabled={!selectedDate || loading}
      >
        {loading ? 'Đang tải...' : 'Xuất báo cáo'}
      </Button>
      
      {!loading && dataToExport.length > 0 && (
        <CSVLink
          data={dataToExport}
          filename={selectedDate ? `report-${format(selectedDate, 'MM-yyyy')}.csv` : 'report.csv'}
          target="_blank"
          style={{ textDecoration: 'none' }} // Bỏ gạch chân mặc định của link
        >
          Tải xuống
        </CSVLink>
      )} */}
        <Grid container spacing={3}>
          <Grid item xs={12} sm={6} md={3}>
            <AppWidgetSummary title="Sản phẩm" total={data?.products} icon={"openmoji:dog-face"} />
          </Grid>

          <Grid item xs={12} sm={6} md={3}>
            <AppWidgetSummary title="Người dùng" total={data?.users} color="info" icon={"ant-design:usergroup-add-outlined"} />
          </Grid>

          <Grid item xs={12} sm={6} md={3}>
            <AppWidgetSummary title="Hóa đơn" total={data?.invoices} color="warning" icon={"lets-icons:order-fill"} />
          </Grid>

          <Grid item xs={12} sm={6} md={3}>
            <AppWidgetSummary title="Doanh số" total={data?.sales} color="error" icon={"carbon:summary-kpi"} />
          </Grid>

          <Grid item xs={12} md={6} lg={8}>
            <AppWebsiteVisits
              title="Website Visits"
              chartLabels={[
                "01/01/2023",
                "02/01/2023",
                "03/01/2023",
                "04/01/2023",
                "05/01/2023",
                "06/01/2023",
                "07/01/2023",
                "08/01/2023",
                "09/01/2023",
                "10/01/2023",
                "11/01/2023"
              ]}
              chartData={[
                {
                  name: "Miền Trung",
                  type: "column",
                  fill: "solid",
                  data: [23, 11, 22, 27, 13, 22, 37, 21, 44, 22, 30]
                },
                {
                  name: "Miền Nam",
                  type: "area",
                  fill: "gradient",
                  data: [44, 55, 41, 67, 22, 43, 21, 41, 56, 27, 43]
                },
                {
                  name: "Miền Bắc",
                  type: "line",
                  fill: "solid",
                  data: [30, 25, 36, 30, 45, 35, 64, 52, 59, 36, 39]
                }
              ]}
            />
          </Grid>

          <Grid item xs={12} md={6} lg={4}>
            <AppCurrentVisits
              title="Số lượt ghé thăm website"
              chartData={[
                { label: "Miền Nam", value: 5435 },
                { label: "Miền Bắc", value: 4000 },
                { label: "Miền Trung", value: 3000 }
              ]}
              chartColors={[
                theme.palette.primary.main,
                theme.palette.info.main,
                theme.palette.warning.main,
                theme.palette.error.main
              ]}
            />
          </Grid>

          <Grid item xs={12} md={6} lg={8}>
            <AppConversionRates
              title="Mức độ hài lòng"
              chartData={[
                { label: "TP.Hồ Chí Minh", value: 470 },
                { label: "Hà Nội", value: 430 },
                { label: "Đà Nẵng", value: 300 },
                { label: "Cần Thơ", value: 400 }
              ]}
            />
          </Grid>

          <Grid item xs={12} md={6} lg={4}>
            <AppCurrentSubject
              title="Giống loài"
              chartLabels={["Corgi", "Alaska", "Husky", "Poodle", "Golden", "Shiba"]}
              chartData={[
                { name: "Nhóm 1", data: [80, 50, 30, 40, 100, 20] },
                { name: "Nhóm 2", data: [20, 30, 40, 80, 20, 80] },
                { name: "Nhóm 3", data: [44, 76, 78, 13, 43, 10] }
              ]}
              chartColors={[...Array(6)].map(() => theme.palette.text.secondary)}
            />
          </Grid>

          {/* <Grid item xs={12} md={6} lg={8}>
            <AppNewsUpdate
              title="News Update"
              list={[...Array(5)].map((_, index) => ({
                id: faker.datatype.uuid(),
                title: faker.name.jobTitle(),
                description: faker.name.jobTitle(),
                image: `../../../assets/images/covers/cover_${index + 1}.jpg`,
                postedAt: faker.date.recent()
              }))}
            />
          </Grid> */}

          {/* <Grid item xs={12} md={6} lg={4}>
            <AppOrderTimeline
              title="Order Timeline"
              list={[...Array(5)].map((_, index) => ({
                id: faker.datatype.uuid(),
                title: [
                  "1983, orders, $4220",
                  "12 Invoices have been paid",
                  "Order #37745 from September",
                  "New order placed #XF-2356",
                  "New order placed #XF-2346"
                ][index],
                type: `order${index + 1}`,
                time: faker.date.past()
              }))}
            />
          </Grid> */}

          {/* <Grid item xs={12} md={6} lg={4}>
            <AppTrafficBySite
              title="Traffic by Site"
              list={[
                {
                  name: "FaceBook",
                  value: 323234,
                  icon: <Iconify icon={"eva:facebook-fill"} color="#1877F2" width={32} />
                },
                {
                  name: "Google",
                  value: 341212,
                  icon: <Iconify icon={"eva:google-fill"} color="#DF3E30" width={32} />
                },
                {
                  name: "Linkedin",
                  value: 411213,
                  icon: <Iconify icon={"eva:linkedin-fill"} color="#006097" width={32} />
                },
                {
                  name: "Twitter",
                  value: 443232,
                  icon: <Iconify icon={"eva:twitter-fill"} color="#1C9CEA" width={32} />
                }
              ]}
            />
          </Grid> */}

          {/* <Grid item xs={12} md={6} lg={8}>
            <AppTasks
              title="Tasks"
              list={[
                { id: "1", label: "Create FireStone Logo" },
                { id: "2", label: "Add SCSS and JS files if required" },
                { id: "3", label: "Stakeholder Meeting" },
                { id: "4", label: "Scoping & Estimations" },
                { id: "5", label: "Sprint Showcase" }
              ]}
            />
          </Grid> */}
        </Grid>
      </Container>
    </>
  );
}