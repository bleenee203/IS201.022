import { Helmet } from "react-helmet-async";
import { filter } from "lodash";
import { sentenceCase } from "change-case";
import { useEffect, useRef, useState } from "react";
// @mui
import {
  Card,
  Table,
  Stack,
  Paper,
  Avatar,
  Button,
  Popover,
  Checkbox,
  TableRow,
  MenuItem,
  TableBody,
  TableCell,
  Container,
  Typography,
  IconButton,
  TableContainer,
  TablePagination,
  FormControl,
  Select,
  InputLabel,
} from "@mui/material";
// components
import Label from "../components/label";
import Iconify from "../components/iconify";
import Scrollbar from "../components/scrollbar";
// sections
import { InvoiceListHead, InvoiceListToolbar } from "../sections/@dashboard/invoice";
// mock
import invoiceApi from "~/apis/modules/invoice.api";
import { toast } from "react-toastify";
import { fDateTime } from "~/utils/formatTime";
import EditInvoiceModal from "~/sections/@dashboard/invoice/EditInvoiceModal";
import { CSVLink } from "react-csv";
import { DatePicker, LocalizationProvider } from "@mui/x-date-pickers";
import { AdapterDateFns } from "@mui/x-date-pickers/AdapterDateFns";
import reportApi from "~/apis/modules/report.api";
import { format } from "date-fns";

// ----------------------------------------------------------------------

const TABLE_HEAD = [
  { id: "id", label: "Mã hóa đơn", alignRight: false },
  { id: "name", label: "Tên khách hàng", alignRight: false },
  { id: "user_id", label: "Mã khách hàng", alignRight: false },
  { id: "payment", label: "Thanh toán", alignRight: false },
  { id: "phone", label: "Số điện thoại", alignRight: false },
  { id: "status", label: "Tình trạng", alignRight: false },
  { id: "create", label: "Ngày mua", alignRight: false },
  { id: "" }
];

// ----------------------------------------------------------------------

function descendingComparator(a, b, orderBy) {
  if (b[orderBy] < a[orderBy]) {
    return -1;
  }
  if (b[orderBy] > a[orderBy]) {
    return 1;
  }
  return 0;
}

function getComparator(order, orderBy) {
  return order === "desc"
    ? (a, b) => descendingComparator(a, b, orderBy)
    : (a, b) => -descendingComparator(a, b, orderBy);
}

function applySortFilter(array, comparator, query) {
  const stabilizedThis = array.map((el, index) => [el, index]);
  stabilizedThis.sort((a, b) => {
    const order = comparator(a[0], b[0]);
    if (order !== 0) return order;
    return a[1] - b[1];
  });
  if (query) {
    return filter(array, (_user) => _user.name.toLowerCase().indexOf(query.toLowerCase()) !== -1);
  }
  return stabilizedThis.map((el) => el[0]);
}

export default function InvoicePage() {
  const [open, setOpen] = useState(null);

  const [data, setData] = useState([]);

  const [page, setPage] = useState(0);

  const [order, setOrder] = useState("asc");

  const [selected, setSelected] = useState([]);

  const [orderBy, setOrderBy] = useState("name");

  const [filterName, setFilterName] = useState("");

  const [rowsPerPage, setRowsPerPage] = useState(5);
  const [openModal, setOpenModal] = useState(null);
  const [selectedId, setSelectedId] = useState(null);
  const [selectedDate, setSelectedDate] = useState(new Date());
  const [paymentStatus, setPaymentStatus] = useState('Tất cả');
  const [deliveryStatus, setDeliveryStatus] = useState('Tất cả');
  console.log(selectedDate?.getMonth() + 1);
  const [dataToExport, setDataToExport] = useState([]);
  const handleDateChange = (date) => {
    setSelectedDate(date);
  };
  const get = async () => {
    try {
      const { response, err } = await invoiceApi.getAll();
      if (err) {
        toast.error(err);
      }
      if (response) {
        setData(response);
      }
    } catch (error) {
      toast.error(error);
    }
  };
  useEffect(() => {
    get();
  }, []);
  useEffect(() => {
    get();
  }, [openModal]);

  const handleOpenMenu = (id) => (event) => {
    setOpen(event.currentTarget);
    setSelectedId(id);
  };

  const handleCloseMenu = () => {
    setOpen(null);
  };

  const handleRequestSort = (event, property) => {
    const isAsc = orderBy === property && order === "asc";
    setOrder(isAsc ? "desc" : "asc");
    setOrderBy(property);
  };

  const handleSelectAllClick = (event) => {
    if (event.target.checked) {
      const newSelecteds = data.map((n) => n.id);
      setSelected(newSelecteds);
      return;
    }
    setSelected([]);
  };

  const handleClick = (event, id) => {
    const selectedIndex = selected.indexOf(id);
    let newSelected = [];
    if (selectedIndex === -1) {
      newSelected = newSelected.concat(selected, id);
    } else if (selectedIndex === 0) {
      newSelected = newSelected.concat(selected.slice(1));
    } else if (selectedIndex === selected.length - 1) {
      newSelected = newSelected.concat(selected.slice(0, -1));
    } else if (selectedIndex > 0) {
      newSelected = newSelected.concat(selected.slice(0, selectedIndex), selected.slice(selectedIndex + 1));
    }
    setSelected(newSelected);
  };

  const handleChangePage = (event, newPage) => {
    setPage(newPage);
  };

  const handleChangeRowsPerPage = (event) => {
    setPage(0);
    setRowsPerPage(parseInt(event.target.value, 10));
  };

  const handleFilterByName = (event) => {
    setPage(0);
    setFilterName(event.target.value);
  };

  const emptyRows = page > 0 ? Math.max(0, (1 + page) * rowsPerPage - data.length) : 0;

  const filteredUsers = applySortFilter(data, getComparator(order, orderBy), filterName);
  const isNotFound = !filteredUsers.length && !!filterName;
  // console.log(filteredUsers)
  const csvLinkRef = useRef();
  const handleExportClick = async () => {
    var month = selectedDate?.getMonth() + 1;
    var year = selectedDate?.getFullYear()
    const { response, err } = await reportApi.getSale({ month, year });
    if (response) {
      console.log(response.value)
      let totalSum = 0;
      const filteredData = response.value.filter(sale =>
        (paymentStatus != "Tất cả" ? sale.payment.toLowerCase() === paymentStatus.toLowerCase() : true)
        &&
      (deliveryStatus!="Tất cả" ? sale.status.toLowerCase() === deliveryStatus.toLowerCase() : true)
      );
      const modifiedData = filteredData?.map(sale => {
        totalSum += sale.total || 0; // Tính tổng total
        return {
          'Ngày bán': sale.createAt ? format(new Date(sale.createAt), 'dd/MM/yyyy') : '',
          'Danh sách sản phẩm': sale.formattedData || '',
          'Tên khách hàng': sale.name || '',
          'Địa chỉ khách hàng': sale.address || '',
          'Số điện thoại khách hàng': sale.phoneNumber || '',
          'Tình trạng thanh toán': sale.payment || '',
          'Tình trạng giao hàng': sale.status || '',
          'Tổng tiền': sale.total || '0',

        };
      });                                                                                                         

      // Thêm thuộc tính tổng total vào đối tượng cuối cùng
      modifiedData.push({
        'Ngày bán': 'Tổng tiền', // Nếu bạn muốn để trống cho các cột khác, hoặc thêm các giá trị mặc định khác ở đây
        'Danh sách sản phẩm': '',
        'Tên khách hàng': '',
        'Địa chỉ khách hàng': '',
        'Số điện thoại khách hàng': '',
        'Tình trạng thanh toán': '',
        'Tình trạng giao hàng': '',
        'Tổng tiền': totalSum,
      });
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
  const handlePaymentStatusChange = (event) => {
    setPaymentStatus(event.target.value);
  };
  const handleDeliveryStatusChange = (event) => {
    setDeliveryStatus(event.target.value);
  };
  return (
    <>
      <Helmet>
        <title> Invoice | Pet Shop </title>
      </Helmet>

      <Container maxWidth="xl">
        <Stack direction="row" alignItems="center" justifyContent="space-between" mb={5}>
          <Typography variant="h4" gutterBottom>
            Quản lý hóa đơn
          </Typography>
          <Button variant="contained" startIcon={<Iconify icon="eva:plus-fill" />} style={{ display: 'none' }}>
            Thêm hóa đơn
          </Button>
        </Stack>
        <div style={{ display: "flex", flexDirection: "column", alignItems: "flex-end" }}>
          <div>
            <LocalizationProvider dateAdapter={AdapterDateFns}>
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
          
            {/* <div style={{ marginTop: "20px", marginBottom: "20px" }}> */}
              <FormControl variant="outlined" style={{  marginLeft: "20px",minWidth: 200 }}>
                <InputLabel id="payment-status-label">Tình trạng thanh toán</InputLabel>
                <Select
                  labelId="payment-status-label"
                  id="payment-status"
                  value={paymentStatus}
                  onChange={handlePaymentStatusChange}
                  label="Tình trạng thanh toán"
                >
                  <MenuItem value="Tất cả">Tất cả</MenuItem>
                  <MenuItem value="Đã thanh toán">Đã thanh toán</MenuItem>
                  <MenuItem value="Chưa thanh toán">Chưa thanh toán</MenuItem>
                </Select>
              </FormControl>
              <FormControl variant="outlined" style={{ marginLeft: "20px",  minWidth: 200 }}>
              <InputLabel id="delivery-status-label">Tình trạng giao hàng</InputLabel>
              <Select
                labelId="delivery-status-label"
                id="delivery-status"
                value={deliveryStatus}
                onChange={handleDeliveryStatusChange}
                label="Tình trạng giao hàng"
              >
                <MenuItem value="Tất cả">Tất cả</MenuItem>
                <MenuItem value="Đang lấy hàng">Đang lấy hàng</MenuItem>
                <MenuItem value="Đang giao">Đang giao</MenuItem>
                <MenuItem value="Thành công">Thành công</MenuItem>
              </Select>
            </FormControl>
            {/* </div> */}
            <div style={{display:"flex", flexDirection: "column",marginBottom: "20px", marginTop: "20px" , alignItems: "flex-end"}}>
            <Button
              color="warning"
              variant="outlined"
              onClick={handleExportClick}
              disabled={!selectedDate||!deliveryStatus||!paymentStatus}
            >
              Xuất báo cáo
            </Button>
            </div>
          </div>
        </div>
        <CSVLink
          data={dataToExport}
          // filename={selectedDate ? `report-${format(selectedDate, 'MM-yyyy')}.csv` : 'report.csv'}
          filename={selectedDate ? `report-${format(selectedDate, 'MM-yyyy')}-${paymentStatus}.csv` : 'report.csv'}

          target="_blank"
          style={{ textDecoration: 'none', display: 'none' }} // Ẩn liên kết để chỉ tải khi dữ liệu sẵn sàng
          ref={csvLinkRef}
        >
          Tải xuống
        </CSVLink>
        <Card>

          <InvoiceListToolbar numSelected={selected.length} filterName={filterName} onFilterName={handleFilterByName} />

          <Scrollbar>
            <TableContainer sx={{ minWidth: 800 }}>
              <Table>
                <InvoiceListHead
                  order={order}
                  orderBy={orderBy}
                  headLabel={TABLE_HEAD}
                  rowCount={data.length}
                  numSelected={selected.length}
                  onRequestSort={handleRequestSort}
                  onSelectAllClick={handleSelectAllClick}
                />
                <TableBody>
                  {filteredUsers.slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage).map((row) => {
                    const { id, name, payment, status, createAt, phoneNumber, user_id } = row;
                    const selectedUser = selected.indexOf(id) !== -1;

                    return (
                      <TableRow hover key={id} tabIndex={-1} role="checkbox" selected={selectedUser}>
                        <TableCell padding="checkbox">
                          <Checkbox checked={selectedUser} onChange={(event) => handleClick(event, id)} />
                        </TableCell>

                        <TableCell align="left">
                          # {id}
                        </TableCell>

                        <TableCell align="left">
                          <Stack direction="row" alignItems="center" spacing={2}>
                            <Avatar alt={name} src={name} />
                            <Typography variant="subtitle2" noWrap>
                              {name}
                            </Typography>
                          </Stack>
                        </TableCell>

                        <TableCell align="left">
                          {user_id}
                        </TableCell>

                        <TableCell align="left" sx={{ textTransform: "capitalize" }}> <Label color={(payment === "chưa thanh toán" && "error") || "success"}>{sentenceCase(payment)}</Label></TableCell>

                        <TableCell align="left">{phoneNumber}</TableCell>

                        <TableCell align="left">
                          <Label color={(status === "Đang lấy hàng" && "info") || "success"}
                            variant="outlined"
                          >{sentenceCase(status)}</Label>
                        </TableCell>
                        <TableCell align="left">{fDateTime(createAt)}</TableCell>

                        <TableCell align="right">
                          <IconButton size="large" color="inherit" onClick={handleOpenMenu(id)}>
                            <Iconify icon={"eva:more-vertical-fill"} />
                          </IconButton>
                        </TableCell>
                      </TableRow>
                    );
                  })}
                  {emptyRows > 0 && (
                    <TableRow style={{ height: 53 * emptyRows }}>
                      <TableCell colSpan={6} />
                    </TableRow>
                  )}
                </TableBody>

                {isNotFound && (
                  <TableBody>
                    <TableRow>
                      <TableCell align="center" colSpan={6} sx={{ py: 3 }}>
                        <Paper
                          sx={{
                            textAlign: "center"
                          }}
                        >
                          <Typography variant="h6" paragraph>
                            Not found
                          </Typography>

                          <Typography variant="body2">
                            No results found for &nbsp;
                            <strong>&quot;{filterName}&quot;</strong>.
                            <br /> Try checking for typos or using complete words.
                          </Typography>
                        </Paper>
                      </TableCell>
                    </TableRow>
                  </TableBody>
                )}
              </Table>
            </TableContainer>
          </Scrollbar>

          <TablePagination
            rowsPerPageOptions={[5, 10, 25]}
            component="div"
            count={data.length}
            rowsPerPage={rowsPerPage}
            page={page}
            onPageChange={handleChangePage}
            onRowsPerPageChange={handleChangeRowsPerPage}
          />
        </Card>
      </Container>

      <Popover
        open={Boolean(open)}
        anchorEl={open}
        onClose={handleCloseMenu}
        anchorOrigin={{ vertical: "top", horizontal: "left" }}
        transformOrigin={{ vertical: "top", horizontal: "right" }}
        PaperProps={{
          sx: {
            p: 1,
            width: 140,
            "& .MuiMenuItem-root": {
              px: 1,
              typography: "body2",
              borderRadius: 0.75
            }
          }
        }}
      >
        <MenuItem onClick={() => setOpenModal(true)}>
          <Iconify icon={"eva:edit-fill"} sx={{ mr: 2 }}
          />
          Chỉnh sửa
        </MenuItem>

      </Popover>
      {
        openModal && <EditInvoiceModal open={openModal} setOpen={setOpenModal} id={selectedId} />
      }
    </>
  );
}
