import Backdrop from "@mui/material/Backdrop";
import Box from "@mui/material/Box";
import Modal from "@mui/material/Modal";
import Fade from "@mui/material/Fade";
import Typography from "@mui/material/Typography";
import Button from "@mui/material/Button";
import Stack from "@mui/material/Stack";
import Breadcrumbs from "@mui/material/Breadcrumbs";
import { useEffect, useState } from "react";
import LoadingButton from "@mui/lab/LoadingButton";
import TextField from "@mui/material/TextField";
import FormControl from "@mui/material/FormControl";
import { toast } from "react-toastify";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import FormLabel from "@mui/material/FormLabel";
import Radio from "@mui/material/Radio";
import RadioGroup from "@mui/material/RadioGroup";
import FormControlLabel from "@mui/material/FormControlLabel";
import Label from "~/components/label";
import { InvoiceSchema } from "~/configs/zod.config";
import invoiceApi from "~/apis/modules/invoice.api";
import { valueLabelFormat } from "~/utils/formatNumber";
import { List, ListItem, ListItemText } from "@mui/material";
import authApi from "~/apis/modules/auth.api";


const style = {
  position: "absolute",
  top: "50%",
  left: "50%",
  transform: "translate(-50%, -50%)",
  width: 1200,
  bgcolor: "background.paper",
  border: "1px solid #000",
  boxShadow: 24,
  p: 4
};

export default function EditUserModal({ open, setOpen, id }) {
  const handleClose = () => setOpen(false);
  const [data, setData] = useState(null);
  const [isLoading, setIsLoading] = useState(false);

  useEffect(() => {
    const get = async () => {
      try {
        const { response, err } = await authApi.getInfo({ id });
        if (err) {
          toast.error(err);
        }
        if (response) {
          setData(response);
          // console.log(response);
          // console.log(data)
          setRadio(response.status)
          setRadioPayment(response.payment)
          console.log(response.payment,radioPayment)
        }
      } catch (error) {
        toast.error(error);
      }
    };
    get();
  }, [id]);

  return (
    <div>
      <Modal
        aria-labelledby="transition-modal-title"
        aria-describedby="transition-modal-description"
        open={open}
        closeAfterTransition
        slots={{ backdrop: Backdrop }}
        slotProps={{
          backdrop: {
            timeout: 500
          }
        }}
      >
        <Fade in={open}>
          <Box sx={style}>
            {
              data && <Stack spacing={3}>
                {/* bread */}
                <div role="presentation">
                  <Breadcrumbs aria-label="breadcrumb">
                    <Typography color="inherit" fontSize={20}>
                    Quản lý người dùng
                    </Typography>
                    <Typography color="text.primary" fontSize={20}>Xem người dùng</Typography>
                    <Typography color="inherit" fontSize={20}>
                      ID - # {id}
                    </Typography>
                  </Breadcrumbs>
                </div>
                {/* bread */}

                {/* content */}
                {/* form */}

                <Box
                  component="form"
                  autoComplete="off"
                  display="flex"
                  flexDirection="column"
                  gap={2}
                >
                  <FormControl>
                    <FormLabel sx={{ mb:"10px", fontWeight:"bold" }}>
                    Tên khách hàng:
                    </FormLabel>
                    
                  </FormControl>

                  <FormControl>
                    <FormLabel sx={{ mb:"10px", fontWeight:"bold" }}>
                    Số điện thoại:
                    </FormLabel>
                    
                  </FormControl>

                  <FormControl>
                    <FormLabel sx={{ mb:"10px", fontWeight:"bold" }}>
                    Email:
                    </FormLabel>
                  </FormControl>
                </Box>

                {/* action btn */}
                <Box display="flex" alignItems="center" gap={2}>
                  
                  <Button onClick={handleClose} variant="text" sx={{ color:"error.main" }}>
                  Hủy
                  </Button>
                </Box>
              </Stack>
            }
          </Box>
        </Fade>
      </Modal>
    </div>
  );
}